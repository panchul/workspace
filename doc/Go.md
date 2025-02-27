[Home](Readme.md)
# Go (Golang)

My Golang sandbox is [https://github.com/panchul/sb_golang](https://github.com/panchul/sb_golang).

Tutorials and refreshers:

https://play.golang.org/p/NeviD0awXjt
https://gobyexample.com/
https://www.youtube.com/watch?v=XCsL89YtqCs - great refresher of the basics!
https://golang.org/doc/effective_go.html Effective Go

---

Installing Go, several ways to do it on Ubuntu
https://www.cyberciti.biz/faq/how-to-install-gol-ang-on-ubuntu-linux/

```bash
    $ sudo apt install golang-go
    $ go version
    go version go1.13.8 linux/amd64
```

To test it, create `hello.go`:

```go
    package main
    import ( 
    	"fmt" 
    	"os" 
    )
    func main() {
        fmt.Println("Hello, world!")
        fmt.Println("hi, ", os.Getenv("USER")) 
    }
```

Run:

```bash
    $ go run hello.go 
    Hello, world!
    hi,  myusername
```

Or to build a binary:

```bash
    $ go build hello.go
    $ ./hello
    Hello, world!
    hi,  myusername
```
    
---

Why Go modules are faster than GOPATH
https://dev.to/tbpalsulich/why-go-modules-are-faster-than-gopath-blj

```bash
    $ mkdir /tmp/tmp.GOPATH
    $ export GOPATH=/tmp/tmp.GOPATH
    $ go env GOPATH # Just to confirm.
    /tmp/tmp.GOPATH

    # Force GOPATH mode. Be sure the current directory
    # doesn't have a go.mod.
    $ export GO111MODULES=off
    $ time go get cloud.google.com/go/storage
    real    9m33.845s
    user    4m1.197s
    sys     0m18.079s
    
    $ mkdir proxy-testing
    $ cd proxy-testing
    $ unset GO111MODULES # Back to the default.
    $ go mod init example.com/proxy-testing
    
    $ go clean -modcache # Careful!
    $ go env -w GOPROXY=direct # direct means go directly to the source.
    $ go env GOPROXY
    direct
    $ time go get cloud.google.com/go/storage
    go: finding cloud.google.com/go/storage v1.10.0
    ...
    
    real    2m6.396s
    user    1m51.447s
    sys     0m18.311s
    
    
    $ go env -w GOPROXY=
    $ go env GOPROXY
    https://proxy.golang.org,direct
    $ go clean -modcache # Careful!
    $ go mod tidy # To start from the same state as before.
    $ time go get cloud.google.com/go/storage
    go: finding cloud.google.com/go/storage v1.10.0
    ...
    
    real    0m10.185s
    user    0m9.610s
    sys     0m1.961s
```

---

Neat multi-player game demo, on terminal, with protobufs, etc.
https://github.com/mortenson/grpc-game-example

---

About io.Reader in Go, with some nice and simple demos.
https://dev.to/andyhaskell/what-is-the-io-reader-in-go-48co

---

Using DDD in Golang. Skeleton code for a db-handling app
https://dev.to/stevensunflash/using-domain-driven-design-ddd-in-golang-3ee5

---

Look for the Getting Started at [http://www.golang.org](http://www.golang.org)

Here's video about the convention on the folder structure: https://www.youtube.com/watch?v=XCsL89YtqCs

More about how to write Go code: [https://golang.org/doc/code.html](https://golang.org/doc/code.html)

Video into to Go Programming: https://www.youtube.com/watch?v=CF9S4QZuV30

--- 

Go Concurrency Patterns:

http://www.youtube.com/watch?v=QDDwwePbDtw

http://www.youtube.com/watch?v=f6kdp27TYZs

More about goroutines and treads:
https://codeburst.io/why-goroutines-are-not-lightweight-threads-7c460c1f155f

---

Misc Go links:

https://plus.google.com/+golang/posts

http://blog.golang.org/

http://golang.org/doc/gdb

http://www.youtube.com/user/gocoding

http://gophervids.appspot.com/

---

Effective Go
https://golang.org/doc/effective_go.html

---

Great resource about Go, with a playground.
Here is, for example about closures:
https://gobyexample.com/closures

```go
    package main
    import "fmt"

    // the returned function _closes over_ the variable `i` to form a closure.
    func intSeq() func() int {
        i := 0
        return func() int {
            i++
            return i
        }
    }
    
    func main() {
        nextInt := intSeq()

        fmt.Println(nextInt())
        fmt.Println(nextInt())
        fmt.Println(nextInt())

        newInts := intSeq()
        fmt.Println(newInts())
    }
```

To run it:

```bash
    $ go run closures.go
    1
    2
    3
    1
```

---

Basic usage of channels

```go
    package main
    import "fmt"
    func main() {
        messages := make(chan string)
        go func() { messages <- "ping" }()

        msg := <-messages
        fmt.Println(msg)
    }
```

To run:

```bash
    $ go run channels.go 
    ping
```

---

Goroutine example(from https://gobyexample.com).

```go
    package main
    import "fmt"
    func f(from string) {
        for i := 0; i < 3; i++ {
            fmt.Println(from, ":", i)
        }
    }

    func main() {

        f("direct")

        go f("goroutine")

        go func(msg string) {
            fmt.Println(msg)
        }("going")

        fmt.Scanln()
        fmt.Println("done")
    }
```

Output:

```bash
    $ go run goroutines.go
    direct : 0
    direct : 1
    direct : 2
    goroutine : 0
    going
    goroutine : 1
    goroutine : 2
    <enter>
    done
```

---

Interesting sample code and demos:
https://github.com/AppliedGo

---

About `context` package.
https://golang.org/pkg/context/

```go
    package main
    import (
        "context"
        "fmt"
    )

    func main() {
        type favContextKey string

        f := func(ctx context.Context, k favContextKey) {
                if v := ctx.Value(k); v != nil {
                        fmt.Println("found value:", v)
                        return
                }
                fmt.Println("key not found:", k)
        }

        k := favContextKey("language")
        ctx := context.WithValue(context.Background(), k, "Go")

        f(ctx, k)
        f(ctx, favContextKey("color"))
    }
```

This is how it works:

```bash
    $ go run context.go 
    found value: Go
    key not found: color
```

---

Interfaces refresher

```go
    package main
    import "fmt"
    import "math"

    type geometry interface {
        area() float64
        perim() float64
    }

    type rect struct {
        width, height float64
    }
    type circle struct {
        radius float64
    }

    func (r rect) area() float64 {
        return r.width * r.height
    }
    func (r rect) perim() float64 {
        return 2*r.width + 2*r.height
    }

    func (c circle) area() float64 {
        return math.Pi * c.radius * c.radius
    }
    func (c circle) perim() float64 {
        return 2 * math.Pi * c.radius
    }

    func measure(g geometry) {
        fmt.Println(g)
        fmt.Println(g.area())
        fmt.Println(g.perim())
    }

    func main() {
        r := rect{width: 3, height: 4}
        c := circle{radius: 5}

        measure(r)
        measure(c)
    }
```

Output:

```bash
    $ go run interfaces.go
    {3 4}
    12
    14
    {5}
    78.53981633974483
    31.41592653589793
```

---

Deploying to Heroku: Docker, Go and React
https://dev.to/cishiv/deploying-to-heroku-docker-go-and-react-38hh

```go
    package main
    import (
        "log"
        "net/http"
        "os"
    )
    func main() {
        /*
            Grab the environment variable that has been hopefully set, but also set up a default
        */
        port := os.Getenv("PORT")
        defaultPort := "8080"
        /*
            Serve the contents of the build directory that was produced as a part of `npm run build` on the root `/`
        */
        http.Handle("/", http.FileServer(http.Dir("./build")))
    
        /*
            Check if the port environment variable has been set and if so, use that, otherwise let's use a reasonable default
        */
        if !(port == "") {
            log.Fatal(http.ListenAndServe(":"+port, nil))
        } else {
            log.Fatal(http.ListenAndServe(":"+defaultPort, nil))
        }
    }
```

And the Dockerfile for it:

```dockerfile
    # Stage 1
    FROM golang:alpine as builder
    RUN apk update && apk add --no-cache git
    RUN mkdir /build
    ADD . /build/
    WORKDIR /build
    RUN go get -d -v
    RUN go build -o deployment-demo .
    # Stage 2
    FROM alpine
    RUN adduser -S -D -H -h /app appuser
    USER appuser
    COPY --from=builder /build/ /app/
    WORKDIR /app
    CMD ["./deployment-demo"]
```

---

A post about TDD in GO
https://dev.to/jankaritech/demonstrating-tdd-test-driven-development-in-go-27b0

---

Example `for` loop with channels

```go
    package main
    import "fmt"
    func main() {
        ch := make(chan int) // Create a channel
        go send123(ch)       // Start send123() in a new goroutine
    
        // Receive and print integers from channel
        for i := range ch {
            fmt.Println(i)
        }
    }
    func send123(ch chan int) {
        // Send 3 integers through channel
        for i := 1; i <= 3; i++ {
            ch <- i
        }
        close(ch) // Close channel
    }
```

---

A state machine in Go (for a simple game and using a 2d library)
https://dev.to/steelx/state-machine-in-go-for-a-2d-game-198l

---
