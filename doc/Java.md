
## UNDER CONSTRUCTION

# Java


---

JDK8:  
http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html  


To install JDK on CentOS:
(https://stackoverflow.com/questions/20901442/how-to-install-jdk-in-centos)

    $ sudo yum install java-1.8.0-openjdk

---

Nice HowTo that mentions JDK:  
https://www3.ntu.edu.sg/home/ehchua/programming/howto/Ubuntu_HowTo.html#jdk  


---

Create a file Hello.java with content:

    public class Hello {
       public static void main(String[] args) {
          System.out.println("Hello, world!");
       }
    }

To compile run ```javac Hello.java```

To execute run ```java Hello``` (runs the ```Hello.class``` file)

---

JMX (Java Management Extensions) overview:
https://www.youtube.com/watch?v=aKGYa6Y9r60

---

To download the jdk
$ wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz

This worked better:
$ wget  --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz

---

[Confluent](Confluent.md) has a bunch of Java libs, e.g. kafka-rest.

---

A bunch of tools expect variable ```JAVA_HOME``` defined. With a jdk, it is jdk dir plus Content/Home

---
