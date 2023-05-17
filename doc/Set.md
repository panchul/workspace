# Set

See Also:
  - [STL](STL.md)
  
My sandbox for data structures is here:
https://github.com/panchul/sb_cpp/blob/master/stl_and_data_structures/set/set.cpp

---

**Contents**

- [Miscellaneous](Set.md#miscellaneous)

---

## Miscellaneous

---

    set<int> s;
    s.insert(3);
    s.insert(2);
    s.insert(5);
    cout << s.count(3) << "\n"; // 1
    cout << s.count(4) << "\n"; // 0
    s.erase(3);
    s.insert(4);
    cout << s.count(3) << "\n"; // 0
    cout << s.count(4) << "\n"; // 1

---

The reference page for set:
http://www.cplusplus.com/reference/set/set/

---

Discussions about failing lambda inside of the set definition, and work-arounds to fix it:
https://stackoverflow.com/questions/14896032/c11-stdset-lambda-comparison-function

    #include <iostream>
    #include <iterator>
    #include <algorithm>
    int main() {
       auto comp = [](int x, int y){ return x < y; };
       auto set  = std::set<int,decltype(comp)>( comp );
    
       set.insert(1);
       set.insert(10);
       set.insert(1); // Dupe!
       set.insert(2);
    
       std::copy( set.begin(), set.end(), std::ostream_iterator<int>(std::cout, "\n") );
    }
    
Which prints:
    
    1
    2
    10

---

    std::set<int> myset;
    std::set<int>::iterator it;
    std::pair<std::set<int>::iterator,bool> ret;
    
    // set some initial values:
    for (int i=1; i<=5; ++i) myset.insert(i*10);    // set: 10 20 30 40 50
    
    ret = myset.insert(20);               // no new element inserted
    
    if (ret.second==false) it=ret.first;  // "it" now points to element 20
    
    myset.insert (it,25);                 // max efficiency inserting
    myset.insert (it,24);                 // max efficiency inserting
    myset.insert (it,26);                 // no max efficiency inserting
    
    int myints[]= {5,10,15};              // 10 already in set, not inserted
    myset.insert (myints,myints+3);

-----  