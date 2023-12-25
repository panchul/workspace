[Home](Readme.md)
# PyTorch

See Also:

  - [KFServing](KFServing.md)
  - [TensorFlow](TensorFlow.md)


**Content**

 - [Installing](PyTorch.md#Installing)
 - [PyTorchServe](PyTorch.md#PyTorchServe)

---

## Installing

---

https://pytorch.org/ecosystem

(the installation has C++ + CUDA 9.0 for Linux)

---

Neural Style Transfer: From THeory to Pytorch Implementation
https://www.youtube.com/watch?v=c3kL9yFGUOY

---

To load a model trained on gpu to the cpu, using torch.load(). From this discussion:
https://discuss.pytorch.org/t/loading-weights-for-cpu-model-while-trained-on-gpu/1032/10

    use_cuda = torch.cuda.is_available()
    DEVICE = torch.device('cuda' if use_cuda else 'cpu')   # 'cpu' in this case

    cpu_model = your_model()
    cpu_model.load_state_dict(torch.load(path_to_your_saved_gpu_model, map_location=DEVICE)

---

Example of saving  a checkpoint using state dictionary (.pth)
 


---

## PyTorchServe

---

Introduction to TorchServe, an open-source model serving library for PyTorch

https://www.youtube.com/watch?v=AIrrI8WOIuk

---