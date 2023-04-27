# Deque

See Also:

  - [STL](STL.md)
  
My sandbox for data structures is here:

https://github.com/panchul/sb_cpp/tree/master/data_structures

---

**Contents**

- [Miscellaneous](Deque.md#miscellaneous)

---

## Miscellaneous

---

Deque Template:

    std::deque<value_type>

Declaration:

    deque<int> mydeque; //Creates a double ended queue of deque of int type

Size

    int length = mydeque.size(); //Gives the size of the deque

Push

    mydeque.push_back(1); //Pushes element at the end
    mydeque.push_front(2); //Pushes element at the beginning

Pop

    mydeque.pop_back(); //Pops element from the end
    mydeque.pop_front(); //Pops element from the beginning

Empty

    mydeque.empty() //Returns a boolean value which tells whether the deque is empty or not

---

Very good benchmark case of vector vs list vs deque
https://baptiste-wicht.com/posts/2012/12/cpp-benchmark-vector-list-deque.html

---
 