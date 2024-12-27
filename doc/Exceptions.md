[Home](Readme.md)
# Exceptions (C++)

See Also:
  - [Cpp](CPP.md)
  - [STL](STL.md)

---

C++ Exceptions :
https://en.cppreference.com/w/cpp/language/exceptions

---

```c++
    // exception constructor
    #include <iostream>       // std::cout
    #include <exception>      // std::exception
    
    struct ooops : std::exception {
      const char* what() const noexcept {return "Ooops!\n";}
    };
    
    int main () {
      ooops e;
      std::exception* p = &e;
      try {
          throw e;       // throwing copy-constructs: ooops(e)
      } catch (std::exception& ex) {
          std::cout << ex.what();
      }
      try {
          throw *p;      // throwing copy-constructs: std::exception(*p)
      } catch (std::exception& ex) {
          std::cout << ex.what();
      }
      return 0;
    }
``
    
---    