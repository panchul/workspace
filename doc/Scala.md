
## UNDER CONSTRUCTION

# Scala

My Scala sandbox is [https://github.com/panchul/sb_scala](https://github.com/panchul/sb_scala).


[http://www.scala-lang.org/](http://www.scala-lang.org/)
[http://docs.scala-lang.org/style/](http://docs.scala-lang.org/style/) Scala coding style guidelines 
[http://danielwestheide.com/scala/neophytes.html](http://danielwestheide.com/scala/neophytes.html) - The Neophyte's Guide to Scala

### ScalaDoc

[Scaladoc](Scaladoc.md) is sometimes used for documentation.

### sbt

Sbt link is at  [Sbt.md](Sbt.md)


### Giter8

Here are some nice templates:
https://github.com/foundweekends/giter8/wiki/giter8-templates


### Eclipse

There is a package of Eclipse that already has the Scala additions, downolad url:
[http://scala-ide.org/download/sdk.html](http://scala-ide.org/download/sdk.html)
    

### Akka
---

Nice Akka distributed  transaction processing example:
[https://github.com/anicolaspp/distributd-transaction-processor](https://github.com/anicolaspp/distributd-transaction-processor)

---

Receptionist pattern, misc
http://www.smartjava.org/content/akka-typed-actors-exploring-receptionist-pattern

---

Book link(a preview)
Applied Akka Patterns: A Hands-On Guide to Designing Distributed Applications 
By Michael Nash, Wade Waldron
https://books.google.com/books?id=2PWzDQAAQBAJ&pg=PA159&lpg=PA159&dq=scalameter+and+akka&source=bl&ots=XYBY3OM4Lw&sig=O2k38PzLk2UfMGGItWcUpZxra80&hl=en&sa=X&ved=0ahUKEwjgoKas0-rSAhWhgVQKHVL6AVQQ6AEILDAD#v=onepage&q=scalameter%20and%20akka&f=false

---

## Testing frameworks

---

[ScalaTest](ScalaTest.md) - for unit-testing, etc.
[Scalameter](Scalameter.md) - for benchmarking, etc.

---

[https://github.com/typelevel/cats](https://github.com/typelevel/cats) - Nice testing link for Scala


Nice scala link with quick demo of runtime info:
http://alvinalexander.com/scala/how-show-memory-ram-use-scala-application-used-free-total-max

## Camel
 
[http://camel.apache.org/eip](http://camel.apache.org/eip) - Enterprise Integration Patterns

Nice book: Camel in Action (has preview and good links)

https://www.manning.com/books/camel-in-action


#### Logging

[http://naildrivin5.com/scalatour/wiki_pages/TypeDependentClosures/](http://naildrivin5.com/scalatour/wiki_pages/TypeDependentClosures/)

## Scalatra, a webserver in Scala

[Scalatra](Scalatra.md)


## JSON in Scala

See [Json](JSON.md) for sample snippets.


## Assorted misc projects to sort out later

https://github.com/ScalaWilliam/xs4s - XML Streaming for Scala

---

## Syntax overview

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