# Go (Golang)

My Golang sandbox is [https://github.com/panchul/sb_golang](https://github.com/panchul/sb_golang).


---

Using DDD in Golang. Skeleton code for a db-handling app
https://dev.to/stevensunflash/using-domain-driven-design-ddd-in-golang-3ee5

---

The best refresher of the basics I have seen so far:
https://www.youtube.com/watch?v=XCsL89YtqCs

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

To run it:

    $ go run closures.go
    1
    2
    3
    1

---

Basic usage of channels

    package main
    import "fmt"
    func main() {
        messages := make(chan string)
        go func() { messages <- "ping" }()

        msg := <-messages
        fmt.Println(msg)
    }

To run:

    $ go run channels.go 
    ping

---

Goroutine example(from https://gobyexample.com).

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

Output:

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

---

Interesting sample code and demos:
https://github.com/AppliedGo

---

About `context` package.
https://golang.org/pkg/context/

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

This is how it works:

    $ go run context.go 
    found value: Go
    key not found: color

---

Interfaces refresher

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

Output:

    $ go run interfaces.go
    {3 4}
    12
    14
    {5}
    78.53981633974483
    31.41592653589793

---

Deploying to Heroku: Docker, Go and React
https://dev.to/cishiv/deploying-to-heroku-docker-go-and-react-38hh

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

And the Dockerfile for it:

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
    
---

A post about TDD in GO
https://dev.to/jankaritech/demonstrating-tdd-test-driven-development-in-go-27b0

---

Example `for` loop with channels

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

---

A state machine in Go (for a simple game and using a 2d library)
https://dev.to/steelx/state-machine-in-go-for-a-2d-game-198l

---