
## Under Construction

# C++

My C/C++ sandbox is [https://github.com/panchul/sb_cpp](https://github.com/panchul/sb_cpp).


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

--
