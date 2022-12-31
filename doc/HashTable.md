# Hash Table

See Also:

  - [Graphs](Graphs.md)
  - [Sorting](Sorting.md)
  - [Algorithms and Data Structures](AlgorithmsDataStructures.md)

https://en.wikipedia.org/wiki/Hash_table

Hash table (`unordered_map` in C++)
Algorithm	Average	Worst case
Space		O(n)	O(n)
Search		O(1)	O(n)
Insert		O(1)	O(n)
Delete		O(1)	O(n)

---

Hash table benchmarks
incise.org/hash-table-benchmarks.html

---

    #include <iostream>
    #include <string>
    #include <unordered_map>
     
    int main()
    {
        std::unordered_map<std::string, int> months;
        months["january"] = 31;
        months["february"] = 28;
        months["march"] = 31;
        months["april"] = 30;
        months["may"] = 31;
        months["june"] = 30;
        months["july"] = 31;
        months["august"] = 31;
        months["september"] = 30;
        months["october"] = 31;
        months["november"] = 30;
        months["december"] = 31;
        std::cout << "september -> " << months["september"] << std::endl;
        std::cout << "april     -> " << months["april"] << std::endl;
        std::cout << "december  -> " << months["december"] << std::endl;
        std::cout << "february  -> " << months["february"] << std::endl;
        
        std::cout << "\nThe whole thing:\n";
        for(auto m : months) {
            std::cout << m.first << " -> " << m.second << "\n";
        }
        return 0;
    }
        
---

Another snippet from my sandbox:    
    
    // $ g++ -std=c++1z <filename> 
    #include <iostream>
    #include <string>
    #include <unordered_map>
    
    struct X {
        int i,j,k;
        X(int ii, int jj, int kk):i(ii),j(jj),k(kk){}
        bool operator==(const X r) const {
            return i ==r.i && j ==r.j && k ==r.k ;
        }
    };
    
    struct hash_X{
      size_t operator()(const X &x) const{
        return std::hash<int>()(x.i) ^ std::hash<int>()(x.j) ^ std::hash<int>()(x.k);
      }
    };
     
    /* or, set the default hash function for X
    namespace std {
        template <>
            class hash<X>{
            public :
            size_t operator()(const X &x ) const{
                return hash<int>()(x.i) ^ hash<int>()(x.j) ^ hash<int>()(x.k);
            }
        };
    } */
     
    int main() {
        std::unordered_map<X,int,hash_X> my_map;
       // std::unordered_map<X,int> my_map; ---- if the default is used
        X oneX(1,2,3);
        my_map[oneX] = 123;
        my_map[X(22,33,44)] = 234;
        my_map[X(22,133,144)] = 1234;
        
        std::cout << my_map[X(22,133,144)] << "\n";
        std::cout << my_map[X(22,33,44)] << "\n";
            
        std::cout << "\nThe whole thing:\n";
        for(auto m : my_map) {
            std::cout << m.first.i << " -> " << m.second << "\n";
        }
        return 0;
    }

---
