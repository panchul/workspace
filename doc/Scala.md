
## UNDER CONSTRUCTION

# Scala

See Also:

 [Sbt.md](Sbt.md)  
 [Scaladoc](Scaladoc.md)  
 [ScalaTest](ScalaTest.md) - for unit-testing, etc.  
 [Scalameter](Scalameter.md) - for benchmarking, etc.  

My Scala sandbox is [https://github.com/panchul/sb_scala](https://github.com/panchul/sb_scala).


[http://www.scala-lang.org/](http://www.scala-lang.org/)
[http://docs.scala-lang.org/style/](http://docs.scala-lang.org/style/) Scala coding style guidelines 
[http://danielwestheide.com/scala/neophytes.html](http://danielwestheide.com/scala/neophytes.html) - The Neophyte's Guide to Scala

---

Refresher links:

- Futures https://docs.scala-lang.org/overviews/core/futures.html (e.g. what's the role of ExecutionContext)
- ORMs, for example, Slick http://slick.lightbend.com/doc/3.2.0/dbio.html (e.g. what is an ORM, how does it work, what's a DBIO)
- AKKA, http and streams https://akka.io/docs/
- GraphQL and generally api design. REST apis, how that works, what are the limits there, alternatives to rest. E.g. Sangria in Scala, Graphene in Python and Apollo in typescript https://sangria-graphql.org/learn/

---

Scale By The Bay 2018: Martin Odersky, Opening Keynote: New Functional Constructs in Scala 3
https://www.youtube.com/watch?v=6P06YHc8faw

---

Kyiv Scala meetup v9 - Implementing a game using FP concepts by John A De Goes
https://www.youtube.com/watch?v=XONTFZ4afY0

---

Nice article on enums and case classes:
http://stackoverflow.com/questions/1898932/case-objects-vs-enumerations-in-scala

More on Scala Enumerators:
http://underscore.io/blog/posts/2014/09/03/enumerations.html

---

Giter8

Here are some nice templates:
https://github.com/foundweekends/giter8/wiki/giter8-templates

---

Eclipse
There is a package of Eclipse that already has the Scala additions, downolad url:
[http://scala-ide.org/download/sdk.html](http://scala-ide.org/download/sdk.html)

--- 

Nice Akka distributed  transaction processing example:
[https://github.com/anicolaspp/distributd-transaction-processor](https://github.com/anicolaspp/distributd-transaction-processor)

---

Akka test links:
http://doc.akka.io/docs/akka/current/scala/testing.html#Expecting_Log_Messages
http://rerun.me/2014/09/29/akka-notes-logging-and-testing/

---

Receptionist pattern, misc
http://www.smartjava.org/content/akka-typed-actors-exploring-receptionist-pattern

---

Book link(a preview)
Applied Akka Patterns: A Hands-On Guide to Designing Distributed Applications 
By Michael Nash, Wade Waldron
https://books.google.com/books?id=2PWzDQAAQBAJ&pg=PA159&lpg=PA159&dq=scalameter+and+akka&source=bl&ots=XYBY3OM4Lw&sig=O2k38PzLk2UfMGGItWcUpZxra80&hl=en&sa=X&ved=0ahUKEwjgoKas0-rSAhWhgVQKHVL6AVQQ6AEILDAD#v=onepage&q=scalameter%20and%20akka&f=false

---

http://doc.akka.io/docs/akka/current/scala/routing.html  
http://doc.akka.io/docs/akka/current/scala/actors.html#Extending_Actors_using_PartialFunction_chaining  
http://stackoverflow.com/questions/18124643/how-to-use-stackable-trait-pattern-with-akka-actors  

http://www.smartjava.org/content/akka-typed-actors-exploring-receptionist-pattern  
http://stackoverflow.com/questions/18339082/how-to-create-routers-in-akka-with-parameterized-actors  

---

Alpakka
https://index.scala-lang.org/akka/alpakka

---

A few links the guys were recommending:

http://doc.akka.io/docs/akka/2.4.16/scala/event-bus.html
https://en.wikipedia.org/wiki/Command_pattern
https://twitter.github.io/scala_school/collections.html
https://www.udacity.com/course/artificial-intelligence-nanodegree--nd889

---

Akka sample for clustering
https://github.com/typesafehub/activator-akka-clustering

---

Some akka doc links to look at

http://doc.akka.io/docs/akka/2.4/scala/event-bus.html
http://doc.akka.io/docs/akka/2.4/scala/distributed-pub-sub.html

Akka testing:
http://doc.akka.io/docs/akka/current/scala/testing.html

About scaladoc formatting
http://docs.scala-lang.org/style/scaladoc.html
http://docs.scala-lang.org/overviews/core/futures.html
https://www.tutorialspoint.com/scala/scala_lists.htm

Scalatest examples, etc.
http://doc.scalatest.org/1.8/org/scalatest/FlatSpec.html

---

[https://github.com/typelevel/cats](https://github.com/typelevel/cats) - Nice testing link for Scala

Nice scala link with quick demo of runtime info:
http://alvinalexander.com/scala/how-show-memory-ram-use-scala-application-used-free-total-max

---

Nice video with overview of Scala features
https://www.youtube.com/watch?v=IobLWVuD-CQ

---

About implicits, quick refresher:
http://stackoverflow.com/questions/10375633/understanding-implicit-in-scala

---

https://github.com/write2munish/Akka-Essentials
Good demos on all sorts of Scala and Akka stuff.

---

http://doc.akka.io/docs/akka/2.4/scala/event-bus.html
http://doc.akka.io/docs/akka/current/scala/distributed-pub-sub.html

---

Camel
 
[http://camel.apache.org/eip](http://camel.apache.org/eip) - Enterprise Integration Patterns

Nice book: Camel in Action (has preview and good links)

https://www.manning.com/books/camel-in-action

---

Logging

[http://naildrivin5.com/scalatour/wiki_pages/TypeDependentClosures/](http://naildrivin5.com/scalatour/wiki_pages/TypeDependentClosures/)

---

Scalatra, a webserver in Scala

[Scalatra](Scalatra.md)


---

JSON in Scala

See [Json](JSON.md) for sample snippets.


---

Assorted misc projects to sort out later
https://github.com/ScalaWilliam/xs4s - XML Streaming for Scala

---

Syntax overview

I'll add these into my Scala sandbox, [https://github.com/panchul/sb_scala](https://github.com/panchul/sb_scala).
Run these in the REPL, or put into a file and run, for example ```$ scala hello.scala``` 

    // run it as
    // $ scala hello.sc my arguments are a plenty
    
    println("With a bunch of arguments using for:")
    for(arg <- args) println(arg)

    println("With a bunch of arguments using while:")
    var i=0
    while(i < args.length) {
      println("args(" + i.toString + ") is \"" + args(i) + "\"")
      i += 1
    }

    println("With a bunch of arguments using foreach:")
    var counter=0
    args.foreach(arg => {
      println("args(" + counter.toString + ") is \"" + arg + "\"")
      counter += 1
    })

    println("Using List count:")
    val aList = List("aaa","aaaa","bbbb", "c", "cccc")
    println(aList.mkString(", "))
    println("aList.count(p => p.length == 4):" + aList.count(p => p.length == 4))

File operations (from my sandbox, [https://github.com/panchul/sb_scala](https://github.com/panchul/sb_scala) )

    import scala.io.Source
    
    val myfilename = if(args.length > 0) args(0) else {
      println("INFO: using my own name as the input file")
      "read.scala"
      }
    for(line <- Source.fromFile(myfilename).getLines())
      println(line.length + " " + line)

---

Link about Monads and Functors:
http://adit.io/posts/2013-04-17-functors,_applicatives,_and_monads_in_pictures.html

---

About variant/invariant, etc.
http://blog.tmorris.net/posts/functors-and-things-using-scala/index.html
http://typelevel.org/blog/2016/02/04/variance-and-functors.html

---

Summary of using ```yield```
https://docs.scala-lang.org/tutorials/FAQ/yield.html


    for (x <- List.range(1, 10); if x % 2 == 1 && !found)
        if (x == 5) found = true else println(x)

That is same as:

    scala> var found = false
    found: Boolean = false

    scala> List.range(1,10).filter(_ % 2 == 1 && !found).foreach(x => if (x == 5) found = true else println(x))
    1
    3
    7
    9

    scala> found = false
    found: Boolean = false
    
    scala> List.range(1,10).withFilter(_ % 2 == 1 && !found).foreach(x => if (x == 5) found = true else println(x))
    1
    3

---

Future Monads

    import scala.concurrent.duration._
    import scala.concurrent.{Future,ExecutionContext,Await}
    import ExecutionContext.Implicits.global
    val f1=Future{
        Thread.sleep(10000)
        1 }
    val f2=Future{
        Thread.sleep(10000)
        2 }
    val f3=for {
        v1 <- f1
        v2 <- f2
        } yield (v1+v2)
    println(Await.result(f3,30.second))

When you do that in the REPL, you'll get:

    3
    
---

Basic template. Reads numbers, adds them up.

    object Solution {
        def main(args: Array[String]) {
        println(io.Source.stdin.getLines().take(2).map(_.toInt).sum)
        }
    }

---

Printing something n times:

    object Solution extends App {
      def f(n:Int): Unit = {
        if(n > 0) {
           println("Hello World");
           f(n-1)
         }
      }
      var n = scala.io.StdIn.readInt
      f(n)
    }

---

