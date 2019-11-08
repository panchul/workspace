
# Algorithms and Data Structures

My sandbox for data structures is here:
https://github.com/panchul/sb_cpp/tree/master/data_structures

STL and related

- [List](List.md)
- [Map](Map.md)
- [Sorting](Sorting.md)
- [Vector](Vector.md)
- [Graphs](Graphs.md)
- splay tree
- cartesian tree
- b-tree
- red-black tree
- avl tree
- kd tree
- skip list
- Random forests
- naïve Bayesian estimators
- gossip protocols
- eventual consistency
- data sharding
- anti-entropy
- Byzantine quorum
- erasure coding
- vector clocks
- traversals(breadth-first, depth-first)
- divide and conquer

---

Free Programming Books:
https://github.com/panchul/free-programming-books

---

More material for interview preparation:
https://github.com/panchul/interviews

---

Skip-list
https://en.wikipedia.org/wiki/Skip_list

---

Big-O Complexity Chart
http://bigocheatsheet.com/

And partial source code for the tables there:
https://github.com/ericdrowell/BigOCheatSheet

---

500 Data Structures and Algorithms interview questions and their solutions
https://techiedelight.quora.com/500-Data-Structures-and-Algorithms-interview-questions-and-their-solutions

---

About cyclomatic complexity
https://blog.feabhas.com/2018/07/code-quality-cyclomatic-complexity/

---

About l-values and r-values
https://blog.feabhas.com/2018/04/handy-cut-keep-guide-stdforward-stdmove/

---

Summary of containers:
https://en.cppreference.com/w/cpp/container

---

Nice MIT OCW:
https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/lecture-videos/

---

Overview of Heaps: 
https://www.cpp.edu/~ftang/courses/CS241/notes/heap.htm

---

Nice collection of algorithms and solutions
https://medium.com/@kingrayhan/500-data-structures-and-algorithms-practice-problems-and-their-solutions-b45a83d803f0

---

MIT lecture about Heap and Heap Sort
https://www.youtube.com/watch?v=B7hVxCmfPtM

---

MIT Knapsack lecture 
https://www.youtube.com/watch?v=ocZMDMZwhCY&list=PLUl4u3cNGP61Oq3tWYp6V_F-5jb5L2iHb&index=21

---

Another basics refresher 
http://bit.ly/2CzlaBD

---

Hash table benchmarks
incise.org/hash-table-benchmarks.html

---

Neat review of Find Median problem(integers are coming in, we need to approximate the median)
https://leetcode.com/problems/find-median-from-data-stream/solution/

more on medians:
https://stackoverflow.com/questions/10657503/find-running-median-from-a-stream-of-integers

The P^2 Algorithm for Dynamic Calculation of Quantiles and Histograms Without Storing Observations 
http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.74.2672&rep=rep1&type=pdf

---

Horner's rule - the rule to compute polinomials without having to get powers of x.
Sum(a[i]*x^i) for i from 0 to n:

    int Horner(int a[], unsigned int n, int x) {
        int result = a[n];
        for(int i=n-1; i>=0; --i)
            result = result * n + a [i];
    
        return result;
    }

---

Floyd's cycle-finding algorithm (Tortoice and Hare)
https://en.wikipedia.org/wiki/Cycle_detection

---

Longest Common Subsequence problem
https://en.wikipedia.org/wiki/Longest_common_subsequence_problem

---

Breadth-First Search
https://en.wikipedia.org/wiki/Breadth-first_search

---

Nice website with a lot of well-written material for interview preps, etc.
https://www.techiedelight.com/find-cost-longest-path-dag/

---