# stack

See Also:
  - [Deque](Deque.md) 
  - [List](List.md) 
  - [Vector](Vector.md) 
  - [Map](Map.md) 
  - [STL](STL.md)

https://en.wikipedia.org/wiki/Stack_(abstract_data_type)

http://www.cplusplus.com/reference/stack/stack/

template <class T, class Container = deque<T> > class stack;

Default container is deque. Vector or list will work too, as long as it has:

    empty
    size
    back
    push_back
    pop_back

---

From my sandbox:

    // constructing stack, and using push/pop, etc.
    // $  g++ -std=c++1z stack.cpp  
    #include <iostream>       // std::cout
    #include <stack>          // std::stack
    #include <vector>         // std::vector
    #include <deque>          // std::deque
    
    int main ()
    {
      std::deque<int> mydeque (3,100);          // deque with 3 elements
      std::vector<int> myvector (2,200);        // vector with 2 elements
    
      std::stack<int> first;                    // empty stack
      std::stack<int> second (mydeque);         // stack initialized to copy of deque
    
      std::stack<int,std::vector<int> > third;  // empty stack using vector
      std::stack<int,std::vector<int> > fourth (myvector);
    
      std::cout << "size of first: " << first.size() << '\n';
      std::cout << "size of second: " << second.size() << '\n';
      std::cout << "size of third: " << third.size() << '\n';
      std::cout << "size of fourth: " << fourth.size() << '\n';
    
      std::stack<int> mystack;
    
      for (int i=0; i<5; ++i) mystack.push(i);
    
      std::cout << "Popping out elements...";
      while (!mystack.empty())
      {
         std::cout << ' ' << mystack.top();
         mystack.pop();
      }
      std::cout << '\n';
    
      return 0;
    }
    
---    

