
## Under Construction

# C++

See Also:
 - [Multithreading](Multithreading.md) 
 - [STL](STL.md) 


My C/C++ sandbox is [https://github.com/panchul/sb_cpp](https://github.com/panchul/sb_cpp).


---

About exceptions (changed from C++11 to C++17)
https://en.cppreference.com/w/cpp/language/noexcept

---

Nice about shared_ptr<>, and !!! About lock_guard<>
https://en.cppreference.com/w/cpp/memory/shared_ptr

    void del(void(*)()) {}
    void fun() {}
    int main(){
        std::shared_ptr<void()> ee(fun, del);
        (*ee)();
    }


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
        int publicMember; // Everything that is aware of Base is also aware that Base contains publicMember.
    protected:
        int protectedMember; // Only the children (and their children) are aware that Base contains protectedMember.
    private:
        int privateMember; //No one but Base is aware of privateMember.
    };

The same happens with public, private and protected inheritance.
Let's consider a class Base and a class Child that inherits from Base.

- If the inheritance is public, everything that is aware of Base and Child is also aware that Child inherits from Base.
- If the inheritance is protected, only Child, and its children, are aware that they inherit from Base.
- If the inheritance is private, no one other than Child is aware of the inheritance.


    class A 
    {
    public:
        int x;
    protected:
        int y;
    private:
        int z;
    };
    
    class B : public A
    {
        // x is public
        // y is protected
        // z is not accessible from B
    };
    
    class C : protected A
    {
        // x is protected
        // y is protected
        // z is not accessible from C
    };
    
    class D : private A    // 'private' is default for classes
    {
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

Demo of ```new``` vs. ```new[]```

    int *i = new int;
    Object *array = new Object[100];

    delete i; // ok
    delete[] array; //ok
    delete array; // all destructors may not be called

---

Whole lot of fun with a ‘slide’ operator:
https://stackoverflow.com/questions/1642028/what-is-the-operator-in-c?rq=1
 
    #include <stdio.h>
    int main()
    {
        int x = 10;

        while (x --> 0) // x goes to 0
        {
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

    int main(int argc, char* argv[])
    {
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
 
    int main()
    {
        ifstream fin1, fin2;
        ofstream fout;
        int n1, n2;
 
        fin1.open("in1.txt");
        fin2.open("in2.txt");
        fout.open("out.txt");

        while(fin1 >> n1 && fin2 >> n2)
        {
            if(n1 < n2)
              fout << n1 << ' ';
            else
              fout << n2 << ' ';
        }
 
        while(fin1 >> n1) fout << n1 << ' ';
        while(fin2 >> n2) fout << n2 << ' ';
    }   

---






---