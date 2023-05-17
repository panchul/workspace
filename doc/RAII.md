# RAII (Resource Acquisition Is Initialization)

See Also:
 - [CPP](CPP.md) 

---

**Contents**

- [Miscellaneous](RAII.md#miscellaneous)

---

## Miscellaneous

---

RAII is a programming concept.
https://dev.to/visheshpatel/7-advanced-c-concepts-you-should-know-4gog

Intent: To guarantee the release of resource(s) at the end of a scope.
Implementation: Wrap resource into a class; resource acquired in the constructor
 immediately after its allocation; and automatically released in the destructor;
 resource used via an interface of the class;
Also known as:
 Execute-around object,
 Resource release is finalization,
 Scope-bound resource management


---

Here is a sample with memory leaks:

    struct resource
    {
        resource(int x, int y) { cout << "resource acquired\n"; }
        ~resource() { cout << "resource destroyed\n"; }
    };
    
    void func()
    {
        resource *ptr = new resource(1, 2);
        int x;
        std::cout << "Enter an integer: ";
        std::cin >> x;
        if (x == 0)
            throw 0; // the function returns early, and ptr won't be deleted!
        if (x < 0)
            return; // the function returns early, and ptr won't be deleted!
        // do stuff with ptr here
        delete ptr;
    }

Here is a smart pointer implementation example:

    template<class T>
    class smart_ptr
    {
        T* m_ptr;
    public:
        template<typename... Args>
        smart_ptr(Args&&... args) : m_ptr(new T(std::forward<Args>(args)...)){}
        ~smart_ptr() { delete m_ptr; }
    
        smart_ptr(const smart_ptr& rhs) = delete;
        smart_ptr& operator=(const smart_ptr& rhs) = delete;
    
        smart_ptr(smart_ptr&& rhs) : m_ptr(exchange(rhs.m_ptr, nullptr)){}
        smart_ptr& operator=(smart_ptr&& rhs){        
            if (&rhs == this) return *this;
            delete m_ptr;
            m_ptr = exchange(rhs.m_ptr,nullptr);
            return *this;
        }
        T& operator*() const { return *m_ptr; }
        T* operator->() const { return m_ptr; }
    };
    
    void func()
    {
        auto ptr = smart_ptr<resource>(1, 2); // now ptr guarantee the release of resource
        // ...
    }

---