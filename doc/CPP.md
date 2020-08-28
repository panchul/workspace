# C++

See Also:

 - [Multithreading](Multithreading.md) 
 - [STL](STL.md) 
 - [AlgorithmsDataStructures](AlgorithmsDataStructures.md) 
 - [Visual Studio Code](VisualStudioCode.md) 
 - [RAII](RAII.md) 
 - [Return Type Resolver](ReturnTypeResolver.md) 
 - [Futures](Futures.md) 

My C/C++ sandbox is [https://github.com/panchul/sb_cpp](https://github.com/panchul/sb_cpp).

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

    vector1.insert(vector1.end(), vector2.begin(), vector2.end());
    
Method 2: Use std::copy with a std::back_inserter()

    std::copy(vector2.begin(), vector2.end(), std::back_inserter(vector1));
    
Method 3: Use std::reserve() and then std::copy()
This means that the vector won’t need to be reallocated during the
copy, so may be faster.

    vector1.reserve(vector1.size() + vector2.size());
    std::copy(vector2.begin(), vector2.end(), vector1.end());

Method 4: Use std::transform() with std::back_inserter()
This means you can use a functor on the elements of vector2 to modify
them or change their type before adding them.

    std::transform(vector2.begin(), vector2.end(), vector1.begin(), transformer());

Method 5: Use std::reserve() and then std::transform()

    vector1.reserve(vector1.size() + vector2.size());
    std::transform(vector2.begin(), vector2.end(), vector1.begin(), transformer());

In all cases you can use the new C++11 std::begin() and std::end() functions to get the beginnings and endings of the vectors.

---

A discussion with options on curl wrappers and C++ networking libraries.
https://stackoverflow.com/questions/1011339/how-do-you-make-a-http-request-with-c

---

Neat features from new C++ standards:
https://dev.to/visheshpatel/21-new-features-of-modern-c-to-use-in-your-project-3f87

For example:

    template <typename X, typename Y>
    auto add(X x, Y y) -> decltype(x + y)
    {
        return x + y;
    }
    add(1, 2);     // == 3
    add(1, 2.0);   // == 3.0
    add(1.5, 1.5); // == 3.0

---

The snippet about futures:

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

---

Nice summary about when use `const` and when `constexpr`
http://www.vishalchovatiya.com/when-to-use-const-vs-constexpr-in-cpp/

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

Or, more basic usage:

    int varA = 3;
    const int varB = 5;
    constexpr int varC = 7;

These are all compile-time known.

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
    
Value of varB would not anymore compile time. While statement with varC will
throw compilation error. The reason is constexpr will always accept a strictly
compile-time value.
    
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

About shared_ptr<>, and !!! About lock_guard<>
https://en.cppreference.com/w/cpp/memory/shared_ptr

    void del(void(*)()) {}
    void fun() {}
    int main(){
        std::shared_ptr<void()> ee(fun, del);
        (*ee)();
    }

---

Nice summary of lambdas.

https://dev.to/visheshpatel/all-about-lambda-function-in-c-j4e

C++ Lambda expressions.

    [&i] ( ) { std::cout << i; }
     
is equivalent to
     
    struct anonymous
    {
        int &m_i;
        anonymous(int &i) : m_i(i) {}
        inline auto operator()() const
        {
            std::cout << i;
        }
    };

---

Higher order lambda, returning a lambda: 

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

---

Nice C++ series, about smart pointers
https://www.youtube.com/watch?v=UOB7-B2MfwA

---

About ‘explicit’ keyword from here:
https://en.cppreference.com/w/cpp/language/explicit

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

---

Interesting notes about push_back() vs. emplace(). Boils down to "don't be a smart-pants, and use push_back() for better readability"
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

Refresher on big-O() notation, and sorting algorithms
http://bigocheatsheet.com/

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

    std::string mystring("govno");
    char p[20];
    p[mystring.copy(p,19)] = '\0';

---

C++ Kafka library:
https://github.com/edenhill/librdkafka

and a wrapper:
https://github.com/mfontanini/cppkafka

---

Good summarizing public/protected/private

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

The same happens with public, private and protected inheritance.
Let's consider a class Base and a class Child that inherits from Base.

- If the inheritance is public, everything that is aware of Base and Child is also aware that Child inherits from Base.
- If the inheritance is protected, only Child, and its children, are aware that they inherit from Base.
- If the inheritance is private, no one other than Child is aware of the inheritance.

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

---

Had an issue with compiling relatively basic code:
```gcc: error trying to exec 'cc1plus': execvp: No such file or directory``` 
needed to run these to fix it:

    $ sudo apt-get update
    $ sudo apt-get install --reinstall build-essential

---

Snippet share website:
coliru.stacked-crooked.com/a/5aa89a65e3a86c98

---

Demo of `new` vs. `new[]`

    int *i = new int;
    Object *array = new Object[100];

    delete i; // ok
    delete[] array; //ok
    delete array; // all destructors may not be called

---

Whole lot of fun with a ‘slide’ operator:
https://stackoverflow.com/questions/1642028/what-is-the-operator-in-c?rq=1
 
    #include <stdio.h>
    int main() {
        int x = 10;
        while (x --> 0) { // x goes to 0
            printf("%d ", x);
        }
    }

"Slide":
    
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

`8 6 4 2`

You can control speed with an arrow!

    int x = 100;
    while( 0 <-------------------- x )
    {
       printf("%d ", x);
    }

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

    #define as ;while
    int main(int argc, char* argv[]) {
        int n = atoi(argv[1]);
        do printf("n is %d\n", n) as ( n --> 0);
        return 0;
    }

---

It also could have been something like

    for(--x++;--x;++x--)
    -->    x-->0
    ++>    x++>0
    -->=   x-->=0
    ++>=   x++>=0

This would also work:

    while (0 <-- x)

---
 
 Merging and sorting of two files
 (more at my C/C++ sandbox is [https://github.com/panchul/sb_cpp](https://github.com/panchul/sb_cpp) )
 
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

---

Class template specialization for a particular type:

    template <>
    class MyTemplate <char> {
        char element;
    public:
        MyTemplate (char arg) {element=arg;}
        char printElement () {
            return element;
        }
    };

---

Funny pattern I actually saw in a production code.

    …
    char ABC[4] = { "ABC" };
    char * tzchars = NULL;
    …

And then

    …
    tzchars = &ABC[0];
    …

---

Some preprocessor tricks. More at https://stackoverflow.com/questions/1562074/how-do-i-show-the-value-of-a-define-at-compile-time

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
    
Above definitions result in:
    
    test.c:10:9: note: #pragma message: NOT_DEFINED=NOT_DEFINED
    test.c:11:9: note: #pragma message: DEFINED_BUT_NO_VALUE=
    test.c:12:9: note: #pragma message: DEFINED_INT=3
    test.c:13:9: note: #pragma message: DEFINED_STR="ABC"

There is also BOOST_PP_STRINGIZE, etc.

---

Refresher on basic i/o (good for programming contests)

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

---

A way to input an array of numbers.
We expect <number>\n<number> <number> ... <number>
 
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

---

The priority queue with the oppostite sorting ( not `less`, but `greater`)

    std::priority_queue<int, std::vector<int>, std::greater<int> > newone;

    if default is 9,8,7,6...0
    then with 'greater' : 0,1,2...8,9
    
---

Converting int to string.        
    
    int a = 123;
    std::string sa(to_string(a)); 

and back

    int b = atoi(sa);

---

    string sa = "something";
    size_t i = sa.find("some");

    if(i != string::npos)
        sa.erase(i, 4); // remove 4 bytes starting form that index

    std::reverse(sa.begin(), sa.end());
    
---

C++ Parameter Pack
https://en.cppreference.com/w/cpp/language/parameter_pack

TODO: write a quck summary

---

Recursive variadic function:

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

---

Nice short collection of idioms.
https://dev.to/visheshpatel/7-advanced-c-concepts-you-should-know-4gog

TODO: summarize and add to the C++ flashcards

---

LibCurl and list of its competitors. C++ libraries for HTTP, FTP, etc. 
https://curl.haxx.se/libcurl/competitors.html


---

merge() example, 
The resulting vector contains: 5 10 10 15 20 20 25 30 40 50

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
   
---
