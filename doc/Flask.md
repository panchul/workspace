[Home](Readme.md)
# Flask

(Http endpoint)

See Also:

- [Django](Django.md)
- [Gunicorn](Gunicorn.md)
- [Nginx](Nginx.md)

---

Installing Flask on Ubuntu 20. Also demoes using `-m venv`.

https://www.tecmint.com/install-flask-in-ubuntu/

    $ sudo apt update -y
    $ python3 --version

Get the prerequisites

    $ sudo apt install build-essential python3-pip libffi-dev python3-dev python3-setuptools libssl-dev
    $ sudo apt install python3-venv
    $ mkdir flask_dir && cd flask_dir

Sandbox it

    $ python3 -m venv venv
    $ source venv/bin/activate
    $ pip3 install flask

Check the version

    $ flask --version

---

A 2-hour guide how to use Flask.
https://morioh.com/p/726e0108751a

TODO: write some notes here.

---

Neat using of Flask for inference service.

https://www.cncf.io/blog/2019/07/30/deploy-your-machine-learning-models-with-kubernetes

Serves the endpoint `/predict`

    from flask import Flask, request, jsonify
    import predict
    
    app = Flask(__name__)
    
    @app.route('/predict', methods=['POST'])
    def run():
        data = request.get_json(force=True)
        input_params = data['input']
        result =  predict.predict(input_params)
        return jsonify({'prediction': result})
    
    if __name__ == '__main__':
        app.run(host='0.0.0.0', port=8080)
        
Here's the `predict.py` :

    import keras
    model = keras.models.load_model("./sentiment2.model.h5")
    
    def predict(sentence):
        encoded = encode_sentence(sentence)
        pred = np.array([encoded])
        pred = vectorize_sequences(pred)
        a = model.predict(pred)
        return a[0][0]
    
    def vectorize_sequences(sequences, dimension=10000):
        results = np.zeros((len(sequences), dimension))
        for i, sequence in enumerate(sequences):
            results[i, sequence] = 1.
        return results

The deployment for it:

    apiVersion: apps/v1 
    kind: Deployment
    metadata:
      name: predict-imdb 
    spec:
      replicas: 1 
      template:
        spec:
          containers:
          - name: app
            image: tensorflow/tensorflow:latest-devel-py3
            command: ["/bin/sh", "-c"]
            args:
             - git clone https://github.com/itayariel/imdb_keras;
               cd imdb_keras;
               pip install -r requirements.txt;
               python server.py;
            ports:
            - containerPort: 808
        
And the service:

    apiVersion: v1
    kind: Service
    metadata:
      name: predict-imdb-service
      labels:
        app: imdb-server
    spec:
      ports:
        - port: 8080
      selector:
        app: imdb-server
      type: NodePort
      
The demo run:

    $ kubectl apply -f deployment.yml
    $ kubectl apply -f service.yml

Use the command `kubectl get services` to find the service IP and port.
    
    $ curl http://node-ip:node-port/predict \ 
            -H 'Content-Type: application/json' \ 
            -d '{"input_params": "I loved this videoLike, love, amazing!!"}'      

---

Another Flask prototyping, in context of KFServing, from:
https://github.com/kubeflow/kfserving/issues/1142

He seemed to have a bunch of GPUs on the system, and

    KFServing Version: 0.4.0
    Kfdef:[k8s_istio/istio_dex/gcp_basic_auth/gcp_iap/aws/aws_cognito/ibm]

The server cod:

    import io
    import json
    
    import torch
    from torchvision import models
    import torchvision.transforms as transforms
    from PIL import Image
    from flask import Flask, jsonify, request
    
    
    app = Flask(__name__)
    imagenet_class_index = json.load(open('./imagenet_class_index.json'))
    device = torch.device('cuda') if torch.cuda.is_available() else torch.device('cpu')
    model = models.densenet121(pretrained=False).to(device)
    model.eval()
    
    
    def transform_image(image_bytes):
        my_transforms = transforms.Compose([transforms.Resize(255),
                                            transforms.CenterCrop(224),
                                            transforms.ToTensor(),
                                            transforms.Normalize(
                                                [0.485, 0.456, 0.406],
                                                [0.229, 0.224, 0.225])])
        image = Image.open(io.BytesIO(image_bytes))
        return my_transforms(image).unsqueeze(0)
    
    
    def get_prediction(image_bytes):
        tensor = transform_image(image_bytes=image_bytes).to(device)
        with torch.no_grad():
            outputs = model.forward(tensor)
            _, y_hat = outputs.max(1)
            predicted_idx = str(y_hat.item())
        return imagenet_class_index[predicted_idx]
    
    
    @app.route('/predict', methods=['POST'])
    def predict():
        if request.method == 'POST':
            file = request.files['file']
            img_bytes = file.read()
            class_id, class_name = get_prediction(image_bytes=img_bytes)
            return jsonify({'class_id': class_id, 'class_name': class_name})
    
    
    if __name__ == '__main__':
        app.run()


kfserving.yaml(his repo: https://github.com/rtrobin/codeMixed/tree/master/server):

    apiVersion: serving.kubeflow.org/v1alpha2
    kind: InferenceService
    metadata:
      name: codemixed
    spec:
      default:
        predictor:
          custom:
            container:
              image: rtrobin/server:test
              env:
                - name: WORKER
                  value: "2"
              resources:
                limits:
                  nvidia.com/gpu: "1"
                requests:
                  nvidia.com/gpu: "1"

pod deployment .yaml(his repo: https://github.com/rtrobin/codeMixed/tree/master/server):

    apiVersion: v1
    kind: Pod
    metadata:
      name: gpu-pod
    spec:
      restartPolicy: Never
      containers:
      - image: rtrobin/server:test
        env:
          - name: WORKER
            value: "2"
        name: torchmodel
        resources:
          limits:
            nvidia.com/gpu: 1

The gunicorn config file:

    # gunicorn.conf
    import os
    workers = int(os.environ.get('WORKER', '4'))
    bind = '0.0.0.0:' + os.environ.get('PORT', '5000')
    daemon = 'false'
    worker_connections = 2000

The dockerfile(his repo: https://github.com/rtrobin/codeMixed/tree/master/server):

    FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-runtime
    LABEL maintainer="robintang.116@gmail.com"
    RUN pip install flask gunicorn gevent \
            --no-cache-dir \
            -i https://mirrors.aliyun.com/pypi/simple
    ENV LANG C.UTF-8
    COPY ./ /workspace/server
    WORKDIR /workspace/server
    ENV PORT=5000
    ENV WORKER=4
    CMD exec gunicorn -c gunicorn.py main:app
        
---
        