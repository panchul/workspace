[Home](Readme.md)
# Futures (the programming concept)

See Also:
 - [CPP](CPP.md) 
 - [Multithreading](Multithreading.md) 
 - [STL](STL.md) 
 - [AlgorithmsDataStructures](AlgorithmsDataStructures.md) 

---

**Contents**

- [Miscellaneous](Futures.md#miscellaneous)

---

## Miscellaneous

---

Example of using futures in C++:

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
