# Java

See Also:

 - [TypeScript](TypeScript.md)
 - [Kotlin](Kotlin.md)

**Contents**

- [Installing](Java.md#installing)
- [Miscellaneous](Java.md#miscellaneous)

---

## Installing 

---

To get Java 17 on Mac with homebrew:

```bash
brew install openjdk@17 
```

https://stackoverflow.com/questions/69875335/macos-how-to-install-java-17

---

Tons of nice ways to install JDK on Ubuntu
https://stackoverflow.com/questions/14788345/how-to-install-the-jdk-on-ubuntu-linux

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

To compile run `javac Hello.java`

To execute run `java Hello` (runs the `Hello.class` file)

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

A bunch of tools expects variable `JAVA_HOME` defined. With a jdk, it is jdk dir plus Content/Home.

---

## Miscellaneous

- ...
