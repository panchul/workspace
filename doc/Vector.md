# Vector

See Also:

  - [STL](STL.md)
  - [AlgorithmsDataStructures](AlgorithmsDataStructures.md) 
  - [Deque](Deque.md)
  - [List](List.md)
  - [Map](Map.md)
  - [Stack](Stack.md)
  
My sandbox for data structures is here:

https://github.com/panchul/sb_cpp/tree/master/data_structures

---

Very good benchmark case of vector vs list vs deque
https://baptiste-wicht.com/posts/2012/12/cpp-benchmark-vector-list-deque.html

---

The simplest ways to define a vector:

    int main() { 
        vector<int> vect{ 10, 20, 30 }; 
      
        for (int x : vect) 
            cout << x << " "; 

        //---------------------------------
        int n = 3; 
        // Create a vector of size n with 
        // all values as 10. 
        vector<int> vect2(n, 10); 
  
        for (int x : vect2) 
            cout << x << " ";
            
        //--------------------------------
        // Create an empty vector 
        vector<int> vect3;  
             
        vect3.push_back(10); 
        vect3.push_back(20); 
        vect3.push_back(30); 
          
        for (int x : vect3) 
            cout << x << " "; 
                                   
        //--------------------------------
        // via an array:
        int arr[] = { 10, 20, 30 }; 
        int n2 = sizeof(arr) / sizeof(arr[0]); 
          
        vector<int> vect4(arr, arr + n2); 
          
        for (int x : vect4) 
            cout << x << " "; 

        //--------------------------------
        // via another vector:
        vector<int> vectA1{ 10, 20, 30 }; 
        vector<int> vectA2(vectA1.begin(), vectA1.end()); 
          
        for (int x : vectA2) 
            cout << x << " "; 
                
        return 0; 
    } 


---

// vector::begin/end

    #include <iostream>
    #include <vector>

    int main () {
      std::vector<int> myvector;
      for (int i=1; i<=5; i++) myvector.push_back(i);

      std::cout << "myvector contains:";
      for (std::vector<int>::iterator it = myvector.begin() ; it != myvector.end(); ++it)
        std::cout << ' ' << *it;
      std::cout << '\n';
      return 0;
    }

---
  