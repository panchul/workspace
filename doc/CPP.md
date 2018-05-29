
## Under Construction

# C++

My C/C++ sandbox is [https://github.com/panchul/sb_cpp](https://github.com/panchul/sb_cpp).


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

Cute collection of tricks. Most are pretty old, but nice to never forget.

http://www.gowrikumar.com/c/index.php


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
 