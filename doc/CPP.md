[Home](Readme.md)
# C++

See Also:

  - [Assembler](Assembler.md)
  - [gdb](Gdb.md)
  - [Multithreading](Multithreading.md) 
  - [STL](STL.md) 
  - [AlgorithmsDataStructures](AlgorithmsDataStructures.md) 
  - [Visual Studio Code](VisualStudioCode.md) 
  - [RAII](RAII.md) 
  - [Return Type Resolver](ReturnTypeResolver.md) 
  - [Futures](Futures.md) 

My C/C++ sandbox is [https://github.com/panchul/sb_cpp](https://github.com/panchul/sb_cpp).

---

**Content**

  - [Low Latency Etc.](CPP.md#low-latency-etc)
  - [Variadic functions](CPP.md#variadic-functions)
  - [Samples](CPP.md#Samples)
  - [Fundamentals](CPP.md#Fundamentals)
  - [Libraries(.so, .dll, .lib, etc.)](CPP.md#libraries)
  - [Miscellaneous](CPP.md#Miscellaneous)

---

## Low Latency Etc.

---

Neat summary of the modern tech

"The C++ techniques you need for $600k hedge fund jobs" https://www.efinancialcareers.com/news/low-latency-c

Forked a nice sandbox: https://github.com/panchul/imperial_hft

Information on low latency C++ can be hard to come by. A paper* released last year by Bilokon and one of his PhD students, Burak Gunduz, looks at 12 techniques for reducing latency in C++ code, as follows:

- Lock-free programming: a concurrent programming paradigm involving multi-threaded algorithms which, unlike their traditional counterparts, do not employ the usage of mutual exclusion mechanisms, such as locks, to arbitrate access to shared resources.
- Single mix multiple data (SMID) instructions: Instructions that take advantage of the parallel processing power of contemporary CPUs, allowing simultaneous execution of multiple operations.
- Mixing data types: When a computation involves both float and double types, implicit conversions are required. If only float computations are used, performance improves. 
- Signed vs unsigned: Ensuring consistent signedness in comparisons to avoid conversions. 
- Prefetching: Explicitly loading data into cache before it is needed to reduce data fetch delays, particularly in memory-bound applications
- Branch reduction: predicting conditional branch outcomes to allow speculative code execution
- Slowpath removal: minimize execution of rarely executed code paths.
- Short-circuiting: Logical expressions cease evaluation when the final result is determined.
- Inlining: Incorporating the body of a function at each point the function is called, reducing function call overhead and enabling further optimisation by the compiler
- Constexpr: Computations marked as constexpr are evaluated at compile time, enabling constant folding and efficient code execution by eliminating runtime calculations
- Compile-time dispatch: Techniques like template specialization or function overloading so that optimised code paths are chosen at compile time based on type or value, avoiding runtime dispatch and early optimisation decision. 
- Cache warming: To minimize memory access time and boost program responsiveness, data is preloaded into the CPU cache before it’s needed.

---

## Variadic functions

---
Simple demo(from https://en.cppreference.com/w/cpp/language/parameter_pack):

```C++
#include <iostream>

void tprintf(const char* format) { // base function
    std::cout << format;
}
 
template<typename T, typename... Targs>
void tprintf(const char* format, T value, Targs... Fargs) { // recursive variadic function
    for ( ; *format != '\0'; format++ ) {
        if ( *format == '%' ) {
           std::cout << value;
           tprintf(format+1, Fargs...); // recursive call
           return;
        }
        std::cout << *format;
    }
}
 
int main() {
    tprintf("% world% %\n","Hello",'!',123);
    return 0;
}
```

---

## Samples

---

A link to Windows tutorials(windows doc samples (classics, win32, legacy, etc.) Drawing Direct2D):
https://docs.microsoft.com/en-us/windows/win32/learnwin32/direct2d-circle-sample

A Windows Sample code repo
https://github.com/microsoft/Windows-classic-samples

More Windows samples
https://docs.microsoft.com/en-us/samples/browse/?redirectedfrom=MSDN-samples&terms=com

---

## Libraries

---

My sandbox about shared libraries:
https://github.com/panchul/sb_cpp/tree/master/shared_libs

---

Implicit vs. explicit linking for DLLs
Implicit is when you use a .h and need to link against a .lib and
explicit when you use LoadLibrary and GetProcAddress respectively.

Determining Which Linking Method to Use
https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2010/253b8k2c(v=vs.100)

https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2010/784bt7z7(v=vs.100)

Search Path Used by Windows to Locate a DLL

With both implicit and explicit linking, Windows first searches for
"known DLLs", such as Kernel32.dll and User32.dll. Windows then searches
for the DLLs in the following sequence:

- The directory where the executable module for the current process is
  located.
- The current directory.
- The Windows system directory. The GetSystemDirectory function retrieves
  the path of this directory.
- The Windows directory. The GetWindowsDirectory function retrieves
  the path of this directory.
- The directories listed in the PATH environment variable.

**Note**
The `LIBPATH` environment variable is not used.

---

## Fundamentals

---

C++ polymorphism means that a call to a member function will cause a different function to be executed depending on the type of object that invokes the function.

https://www.cplusplus.com/doc/tutorial/polymorphism/

---

Good summarizing public/protected/private

```C++
    class Base {
    public:
        int publicMember; // Everything that is aware of Base is also
                          // aware that Base contains publicMember.
    protected:
        int protectedMember; // Only the children (and their children)
                            // are aware that Base contains protectedMember.
    private:
        int privateMember; //No one but Base is aware of privateMember.
    };
```

The same happens with public, private and protected inheritance.
Let's consider a class Base and a class Child that inherits from Base.

- If the inheritance is public, everything that is aware of Base and Child is also aware that Child inherits
  from Base.
- If the inheritance is protected, only Child, and its children, are aware that they inherit from Base.
- If the inheritance is private, no one other than Child is aware of the inheritance.


```C++
    class A {
    public:
        int x;
    protected:
        int y;
    private:
        int z;
    };
    
    class B : public A {
        // x is public
        // y is protected
        // z is not accessible from B
    };
    
    class C : protected A {
        // x is protected
        // y is protected
        // z is not accessible from C
    };
    
    class D : private A {   // 'private' is default for classes
        // x is private
        // y is private
        // z is not accessible from D
    };
```
---

Demo of `new` vs. `new[]` (use the matching form of `delete`)

```C++
    int *i = new int;
    Object *array = new Object[100];

    delete i; // ok
    delete[] array; //ok
    delete array; // all destructors may not be called
```

---

Refresher on big-O() notation, and sorting algorithms

http://bigocheatsheet.com/

---

## Miscellaneous

---

Exporting and importing using `AFX_EXT_CLASS`
https://docs.microsoft.com/en-us/cpp/build/exporting-and-importing-using-afx-ext-class?view=msvc-160

---

Discussion on ways to do debug printing in a Windows application:

https://stackoverflow.com/questions/1333527/how-do-i-print-to-the-debug-output-window-in-a-win32-app

---

Another website with a collection of community-created snippets.
https://cppsecrets.com

---

Neat article, C++ Coroutines: Understanding Symmetric Transfer
https://lewissbaker.github.io/2020/05/11/understanding_symmetric_transfer

You can see the complete set of code in Compiler Explorer here: https://godbolt.org/z/-Kw6Nf

---

Neat summary on concatenation of sequence containers:
http://www.martinbroadhurst.com/concatenate-two-vectors-in-c.html

Method 1: Use std::vector::insert()

```C++
    vector1.insert(vector1.end(), vector2.begin(), vector2.end());
    // insert <where>, <start> - <end>    
```

Method 2: Use std::copy with a std::back_inserter()

```C++
    std::copy(vector2.begin(), vector2.end(), std::back_inserter(vector1));
    // copy < what: start, end> <where to>   
```

Method 3: Use std::reserve() and then std::copy()
This means that the vector won’t need to be reallocated during the
copy, so may be faster.

```C++
    vector1.reserve(vector1.size() + vector2.size());
    std::copy(vector2.begin(), vector2.end(), vector1.end());
    // actually probably needs 'resize', etc. the snippet above does not work. 2020/11/13
```

Method 4: Use std::transform() with std::back_inserter()
This means you can use a functor on the elements of vector2 to modify
them or change their type before adding them.

```C++
    std::transform(vector2.begin(), vector2.end(), vector1.begin(), transformer());
```

Method 5: Use std::reserve() and then std::transform()

```C++
    vector1.reserve(vector1.size() + vector2.size());
    std::transform(vector2.begin(), vector2.end(), vector1.begin(), transformer());
```

In all cases you can use the new C++11 std::begin() and std::end() functions to get the beginnings and
endings of the vectors.

---

A discussion with options on curl wrappers and C++ networking libraries.
https://stackoverflow.com/questions/1011339/how-do-you-make-a-http-request-with-c

---

Neat features from new C++ standards:
https://dev.to/visheshpatel/21-new-features-of-modern-c-to-use-in-your-project-3f87

For example:

```C++
    template <typename X, typename Y>
    auto add(X x, Y y) -> decltype(x + y)
    {
        return x + y;
    }
    add(1, 2);     // == 3
    add(1, 2.0);   // == 3.0
    add(1.5, 1.5); // == 3.0
```
---

The snippet about futures:

```C++
    // $ g++ -std=c++1z filename.cpp 
    // future example
    // see more at http://www.cplusplus.com/reference/future/future/
    
    #include <iostream>       // std::cout
    #include <future>         // std::async, std::future
    #include <chrono>         // std::chrono::milliseconds
    
    // a non-optimized way of checking for prime numbers:
    bool is_prime (int x) {
      for (int i=2; i<x; ++i) if (x%i==0) return false;
      return true;
    }
    
    int main ()
    {
      // call function asynchronously:
      std::future<bool> fut = std::async (is_prime,444444443); 
    
      // do something while waiting for function to set future:
      std::cout << "checking, please wait";
      std::chrono::milliseconds span (100);
      while (fut.wait_for(span)==std::future_status::timeout)
        std::cout << '.' << std::flush;
    
      bool x = fut.get();     // retrieve return value
    
      std::cout << "\n444444443 " << (x?"is":"is not") << " prime.\n";
    
      return 0;
    }
```
---

Nice summary about when use `const` and when `constexpr`
http://www.vishalchovatiya.com/when-to-use-const-vs-constexpr-in-cpp/

```C++
    using ull = unsigned long long;
    constexpr ull operator"" _KB(ull no)
    {
        return no * 1024;
    }
    constexpr ull operator"" _MB(ull no)
    {
        return no * (1024_KB);
    }
    int main()
    {
        cout << 1_KB << endl;
        cout << hex << 1_MB << endl;
    }
```

Or, more basic usage:

```C++
    int varA = 3;
    const int varB = 5;
    constexpr int varC = 7;
```

These are all compile-time known.

```C++
    int getRandomNo()
    {
        return rand() % 10;
    }
    int main()
    {
        const int varB = getRandomNo();       // OK
        constexpr int varC = getRandomNo();   // not OK! compilation error
        return 0;
    }
```

Value of varB would not anymore compile time. While statement with varC will
throw compilation error. The reason is constexpr will always accept a strictly
compile-time value.
    
```C++
    constexpr int sum(int x, int y)
    {
        return x + y;
    }
    int main()
    {
        const int result = sum(10, 20);     // Here, you can use constexpr as well
        cout << result;
        return 0;
    }
```

`const` & `constexpr` both can be applied to member methods. Member methods are
made const to make sure that there are no accidental changes by the method. On
the other hand, the idea of using constexpr is to compute expressions at compile
time so that time can be saved when the code is running.

---

7 Best practices for exception handling in C++ with examples
http://www.vishalchovatiya.com/7-best-practices-for-exception-handling-in-cpp-with-example/

TODO: summarize.
    
---

Comparison of IDEs for C++ for Linux.
https://www.tecmint.com/best-linux-ide-editors-source-code-editors/

26 of them:

Visual Studio Code has nice extensions. Here is a Go extension, for example:
https://github.com/Microsoft/vscode-go

---

CppCon 2019: “The One-Decade Task: Putting std::atomic in CUDA.”
https://www.youtube.com/watch?v=VogqOscJYvk

---

An interview with Bjarne Stroustrup 2019
https://news.codecademy.com/bjarne-stroustrup-interview/

---

Neat collection of style guides, C++ in particular:
https://google.github.io/styleguide/cppguide.html

---

About exceptions (changed from C++11 to C++17)
https://en.cppreference.com/w/cpp/language/noexcept

---

About ‘noexcept’ specifier
https://en.cppreference.com/w/cpp/language/noexcept_spec

---

About lvalues, rvalues, prvalues, etc.
https://en.cppreference.com/w/cpp/language/value_category

---

About `shared_ptr<>`, and !!! About `lock_guard<>`

https://en.cppreference.com/w/cpp/memory/shared_ptr

```C++
    void del(void(*)()) {}
    void fun() {}
    int main(){
        std::shared_ptr<void()> ee(fun, del);
        (*ee)();
    }
```
---

Nice summary of lambdas.

https://dev.to/visheshpatel/all-about-lambda-function-in-c-j4e

C++ Lambda expressions.

```C++
    [&i] ( ) { std::cout << i; }
```     
is equivalent to
     
```C++
    struct anonymous
    {
        int &m_i;
        anonymous(int &i) : m_i(i) {}
        inline auto operator()() const
        {
            std::cout << i;
        }
    };
```
---

Higher order lambda, returning a lambda: 

```C++
    const auto less_than = [](auto x) {
        return [x](auto y) {
            return y < x;
        };
    };
     
    int main(void)
    {
       auto less_than_five = less_than(5);
       std::cout << less_than_five(3) << std::endl;
       std::cout << less_than_five(10) << std::endl;
       return 0;
    }
```
---

Nice C++ series, about smart pointers
https://www.youtube.com/watch?v=UOB7-B2MfwA

---

About ‘explicit’ keyword from here:
https://en.cppreference.com/w/cpp/language/explicit

```C++
    struct A
    {
        A(int) { }      // converting constructor
        A(int, int) { } // converting constructor (C++11)
        operator bool() const { return true; }
    };

    struct B
    {
        explicit B(int) { }
        explicit B(int, int) { }
        explicit operator bool() const { return true; }
    };

    int main()
    {
        A a1 = 1;      // OK: copy-initialization selects A::A(int)
        A a2(2);       // OK: direct-initialization selects A::A(int)
        A a3 {4, 5};   // OK: direct-list-initialization selects A::A(int, int)
        A a4 = {4, 5}; // OK: copy-list-initialization selects A::A(int, int)
        A a5 = (A)1;   // OK: explicit cast performs static_cast
        if (a1) ;      // OK: A::operator bool()
        bool na1 = a1; // OK: copy-initialization selects A::operator bool()
        bool na2 = static_cast<bool>(a1); // OK: static_cast performs direct-initialization
    //  B b1 = 1;      // error: copy-initialization does not consider B::B(int)
        B b2(2);       // OK: direct-initialization selects B::B(int)
        B b3 {4, 5};   // OK: direct-list-initialization selects B::B(int, int)
    //  B b4 = {4, 5}; // error: copy-list-initialization does not consider B::B(int,int)
        B b5 = (B)1;   // OK: explicit cast performs static_cast
        if (b2) ;      // OK: B::operator bool()
    //  bool nb1 = b2; // error: copy-initialization does not consider B::operator bool()
        bool nb2 = static_cast<bool>(b2); // OK: static_cast performs direct-initialization
    }
```
---

Interesting notes about push_back() vs. emplace(). Boils down to "don't be
a smart-pants, and use push_back() for better readability"
https://abseil.io/tips/112

---

Compiler support for C++17 features and others
https://en.cppreference.com/w/cpp/compiler_support

---

Creating and using console i/o from win32 gui application
http://dslweb.nwnexus.com/~ast/dload/guicon.htm

---

Nice overview of the iterators
http://thispointer.com/c-different-ways-to-iterate-over-a-list-of-objects/

---

Neat talk on C++14 back when it was released
https://www.youtube.com/watch?v=IqVZG6jWXvs

---

Refresher on socket communications in C for a webserver(has very neat skeleton code just like in Stevens book):

    https://www.ibm.com/developerworks/systems/library/es-nweb/index.html

Neat Web server in C, a derivation of the IBM’s:

    https://github.com/davidsblog/dweb

---

Summary C++ 17 – New and Removed Features
https://www.mycplus.com/featured-articles/cplusplus-17-features/

---

http://www.modernescpp.com/index.php/what-is-modern-c 
Overview of C++ trends and guidelines

---

https://github.com/isocpp/CppCoreGuidelines
Neat collection of C++ guidelines

---

Stanford Professor YouTube Channel
https://www.youtube.com/channel/UCcH4Ga14Y4ELFKrEYM1vXCg

---

Great algorithm refresher
https://www.geeksforgeeks.org/top-10-algorithms-in-interview-questions/

---

GNU C manual
https://www.gnu.org/software/gnu-c-manual/gnu-c-manual.html

---

Cute collection of tricks. Most are pretty old, but nice to never forget.
http://www.gowrikumar.com/c/index.php

---

Idiomatic assigning char array a string:

```C++
    std::string mystring("govno");
    char p[20];
    p[mystring.copy(p,19)] = '\0';
```
---

C++ Kafka library:
https://github.com/edenhill/librdkafka

and a wrapper:
https://github.com/mfontanini/cppkafka

---

Had an issue with compiling relatively basic code:

`gcc: error trying to exec 'cc1plus': execvp: No such file or directory`
 
needed to run these to fix it:

```bash
    $ sudo apt-get update
    $ sudo apt-get install --reinstall build-essential
```
---

Snippet share website:
coliru.stacked-crooked.com/a/5aa89a65e3a86c98

---

Whole lot of fun with a ‘slide’ operator:
https://stackoverflow.com/questions/1642028/what-is-the-operator-in-c?rq=1
 
```C++
    #include <stdio.h>
    int main() {
        int x = 10;
        while (x --> 0) { // x goes to 0
            printf("%d ", x);
        }
    }
```    

"Slide":
    
```C++
    while (x --\
                \
                 \
                  \
                   > 0)
    printf("%d ", x);

    int x = 10;

    while( 0 <---- x )
    {
       printf("%d ", x);
    }
```

`8 6 4 2`

You can control speed with an arrow! :-)

```C++
    int x = 100;
    while( 0 <-------------------- x )
    {
       printf("%d ", x);
    }
```

`90 80 70 60 50 40 30 20 10`

Laser:

    while( 0 > - - - - - -- -- -- -- -- ---------- x )
 
Compilers try to parse expressions to the biggest token by using the left right rule.
In this case, the expression:

    x-->0

Parses to biggest tokens:

    token 1: x
    token 2: --
    token 3: >
    token 4: 0
    conclude: x-- > 0

The same rule applies to this expression:
    
    a-----b

After parse:
    
    token 1: a
    token 2: --
    token 3: --
    token 4: -
    token 5: b

    conclude: (a--)-- - b

---

```C++
    #define as ;while
    int main(int argc, char* argv[]) {
        int n = atoi(argv[1]);
        do printf("n is %d\n", n) as ( n --> 0);
        return 0;
    }
```
---

It also could have been something like

```C++
    for(--x++;--x;++x--)
    -->    x-->0
    ++>    x++>0
    -->=   x-->=0
    ++>=   x++>=0
```

This would also work:

```C++
    while (0 <-- x)
```
---
 
 Merging and sorting of two files
 (more at my C/C++ sandbox is [https://github.com/panchul/sb_cpp](https://github.com/panchul/sb_cpp) )
 
```C++
    //
    // in1.txt:
    // 2 4 6 
    //
    // in2.txt:
    // 1 3 5 7 
    
    // out.txt should be:
    // 1 2 3 4 5 6 7
    	
    #include <iostream>
    #include <fstream>
    using namespace std;
 
    int main() {
        ifstream fin1, fin2;
        ofstream fout;
        int n1, n2;
 
        fin1.open("in1.txt");
        fin2.open("in2.txt");
        fout.open("out.txt");

        while(fin1 >> n1 && fin2 >> n2) {
            if(n1 < n2)
              fout << n1 << ' ';
            else
              fout << n2 << ' ';
        }
 
        while(fin1 >> n1) fout << n1 << ' ';
        while(fin2 >> n2) fout << n2 << ' ';
    }   
```

---

Class template specialization for a particular type:

```C++
    template <>
    class MyTemplate <char> {
        char element;
    public:
        MyTemplate (char arg) {element=arg;}
        char printElement () {
            return element;
        }
    };
```

---

A funny pattern I actually saw in a production code.

```C++
    …
    char ABC[4] = { "ABC" };
    char * tzchars = NULL;
    …
```

And then

```C++
    …
    tzchars = &ABC[0];
    …
```

---

Some preprocessor tricks. More at
 https://stackoverflow.com/questions/1562074/how-do-i-show-the-value-of-a-define-at-compile-time

```C++
    /* Some test definition here */
    #define DEFINED_BUT_NO_VALUE
    #define DEFINED_INT 3
    #define DEFINED_STR "ABC"
    
    /* definition to expand macro then apply to pragma message */
    #define VALUE_TO_STRING(x) #x
    #define VALUE(x) VALUE_TO_STRING(x)
    #define VAR_NAME_VALUE(var) #var "="  VALUE(var)
    
    /* Some example here */
    #pragma message(VAR_NAME_VALUE(NOT_DEFINED))
    #pragma message(VAR_NAME_VALUE(DEFINED_BUT_NO_VALUE))
    #pragma message(VAR_NAME_VALUE(DEFINED_INT))
    #pragma message(VAR_NAME_VALUE(DEFINED_STR))
```

Above definitions result in:
    
    test.c:10:9: note: #pragma message: NOT_DEFINED=NOT_DEFINED
    test.c:11:9: note: #pragma message: DEFINED_BUT_NO_VALUE=
    test.c:12:9: note: #pragma message: DEFINED_INT=3
    test.c:13:9: note: #pragma message: DEFINED_STR="ABC"

There is also BOOST_PP_STRINGIZE, etc.

---

Refresher on basic i/o (good for programming contests)

```C++
    int a, b; string x;
    cin >> a >> b >> x;
    
    int a = 123, b = 456; string x = "monkey";
    cout << a << " " << b << " " << x << "\n";
    
    ios::sync_with_stdio(0); //
    cin.tie(0);              // This will make faster i/o
    
    string s;
    getline(cin, s); // Whole line
    
    while (cin >> x) { // Until there is data
        // code
    }
    
    freopen("input.txt", "r", stdin);   //
    freopen("output.txt", "w", stdout); // redirect of std i/o
```

---

A way to input an array of numbers.
We expect <number>\n<number> <number> ... <number>
 
```C++
    int n;
    cin >> n;
    cin.ignore(numeric_limits<streamsize>::max(), '\n');

    string c_temp_temp;
    getline(cin, c_temp_temp);

    vector<string> c_temp = split_string(c_temp_temp);
    vector<int> c(n);

    for (int i = 0; i < n; i++) {
        int c_item = stoi(c_temp[i]);
        c[i] = c_item;
    }
    int result = MyFuncThatExpectsVectorINT(c);
    ...
```

---

The priority queue with the opposite sorting ( not `less`, but `greater`)

```C++
    std::priority_queue<int, std::vector<int>, std::greater<int> > newone;
```

If default is `9,8,7,6...0`, then with 'greater' : `0,1,2...8,9`

---

Converting int to string.        
    
```C++
    int a = 123;
    std::string sa(to_string(a)); 
```

and back

```C++
    int b = atoi(sa);
```

There should also be `stoi(sa)`.

---

```C++
    string sa = "something";
    size_t i = sa.find("some");

    if(i != string::npos)
        sa.erase(i, 4); // remove 4 bytes starting form that index

    std::reverse(sa.begin(), sa.end());
```

---

C++ Parameter Pack
https://en.cppreference.com/w/cpp/language/parameter_pack

TODO: write a quick summary

---

Recursive variadic function:

```C++
    #include <iostream>
    void tprintf(const char* format) // base function
    {
        std::cout << format;
    }
     
    template<typename T, typename... Targs>
    void tprintf(const char* format, T value, Targs... Fargs) // recursive variadic function
    {
        for ( ; *format != '\0'; format++ ) {
            if ( *format == '%' ) {
               std::cout << value;
               tprintf(format+1, Fargs...); // recursive call
               return;
            }
            std::cout << *format;
        }
    }
     
    int main() {
        tprintf("% world% %\n","Hello",'!',123);
        return 0;
    }
```

---

Nice short collection of idioms.
https://dev.to/visheshpatel/7-advanced-c-concepts-you-should-know-4gog

TODO: summarize and add to the C++ flashcards

---

LibCurl and list of its competitors. C++ libraries for HTTP, FTP, etc. 
https://curl.haxx.se/libcurl/competitors.html

---

`merge()` example, 
The resulting vector contains: `5 10 10 15 20 20 25 30 40 50`

```C++
    // merge algorithm example
    #include <iostream>     // std::cout
    #include <algorithm>    // std::merge, std::sort
    #include <vector>       // std::vector
    
    int main () {
      int first[] = {5,10,15,20,25};
      int second[] = {50,40,30,20,10};
      std::vector<int> v(10);
    
      std::sort (first,first+5);
      std::sort (second,second+5);
      std::merge (first,first+5,second,second+5,v.begin());
    
      std::cout << "The resulting vector contains:";
      for (std::vector<int>::iterator it=v.begin(); it!=v.end(); ++it)
        std::cout << ' ' << *it;
      std::cout << '\n';
    
      return 0;
    }
```

---
