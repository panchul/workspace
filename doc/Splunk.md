# Splunk framework

https://www.splunk.com/

---

**Contents**

- [Miscellaneous](Splunk.md#miscellaneous)

---

## Miscellaneous

---

Quick reference guide
https://www.splunk.com/pdfs/solution-guides/splunk-quick-reference-guide.pdf

Best of Conf 2018: https://www.splunk.com/pdfs/ebooks/top-five-highlights-from-splunk-conf18.pdf
How-to Videos: https://www.splunk.com/view/education-videos/SP-CAAAGB6
Splunk Applications: https://splunkbase.splunk.com
Installation Guide:  http://docs.splunk.com/Documentation/Splunk/latest/Installation/Whatsinthismanual
    
---

Getting started resources:
https://www.splunk.com/en_us/resources/getting-started.html

    $ wget -O ~/tmp/splunk-7.2.4-8a94541dcfac-linux-2.6-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=7.2.4&product=splunk&filename=splunk-7.2.4-8a94541dcfac-linux-2.6-x86_64.tgz&wget=true'
    ...
    $ tar xzf ~/tmp/splunk-7.2.4-8a94541dcfac-linux-2.6-x86_64.tgz -c /opt
    ...

To start:
    
    $ splunk start --accept-license
    ...
    username:dataadmin or whatever
    password:...
    
Or to start at boot time:

    $ sudo /opt/splunk/bin/splunk enable boot-start -- user dcardozo    
    

https://github.com/splunk/kafka-connect-splunk    
    
---

Splunk Kafka Connect sources and releases
https://github.com/splunk/kafka-connect-splunk
    
---

Splunk Connect for Kafka, Documentation
https://docs.splunk.com/Documentation/KafkaConnect

---

Splunk Connect for HTTP events
https://docs.splunk.com/Documentation/Splunk/7.2.0/Data/FormateventsforHTTPEventCollector

HTTP Event Collector (HEC) receives events from clients in a series of HTTP requests.
Each request can contain an HEC token, a channel identifier header, event metadata,
or event data depending on whether your events are raw or JSON.

Sends back the index ack
https://docs.splunk.com/Documentation/Splunk/7.2.0/Data/AboutHECIDXAck

Some examples:
https://docs.splunk.com/Documentation/Splunk/7.2.0/Data/HECExamples

---
