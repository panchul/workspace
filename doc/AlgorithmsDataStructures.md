# Algorithms and Data Structures

My sandbox for data structures is here:
https://github.com/panchul/sb_cpp/tree/master/data_structures

STL and related

- A-star
- cartesian tree
- [Dijkstra(minimum spanning graph)](Dijkstra.md)
- [Graphs](Graphs.md)
- [Hash Table](HashTable.md)
- [List](List.md)
- [Map](Map.md)
- [Sorting](Sorting.md)
- [Vector](Vector.md)
- [BFS](BFS.md)
- splay tree
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
- [Markov Chains](MarkovChains.md)

---

50 Data structure and algorithm interview questions
https://www.hackernoon.com/50-data-structure-and-algorithms-interview-questions-for-programmers-b4b1ac61f5b0

---

Kirchhoff's theorem (about the number of spanning trees of a graph)
https://en.wikipedia.org/wiki/Kirchhoff%27s_theorem

t(G) = 1/n * lambda1 * lambda2 * ... * lambda(n-1)
where lambda(i) is non-zero eigenvalues of its Laplacian matrix.

Laplacian matrix
https://en.wikipedia.org/wiki/Laplacian_matrix
L = D - A
D - degree matrix (on diagonal - the number of connections of a node)
A - adjacency matrix (0 - not connected, 1 - connected)

LU decomposition
https://en.wikipedia.org/wiki/LU_decomposition

---

About Negative integers in Modular Arithmetic
https://www.youtube.com/watch?v=2rbeCUMBYgk

mod m:
n = q * m + R
R - remainder

 51 mod 10 = 1        5 * 10 + 1
-51 mod 10 = 9       -6 * 10 + 9

---

Substring search

KMP
https://en.wikipedia.org/wiki/Knuth%E2%80%93Morris%E2%80%93Pratt_algorithm

Boyer-Moore
https://en.wikipedia.org/wiki/Boyer%E2%80%93Moore_string-search_algorithm

Rabin-Karp (Rolling hash)
https://en.wikipedia.org/wiki/Rabin%E2%80%93Karp_algorithm

---

Prim's algorithm (minimal spanning tree), Kruskal
https://en.wikipedia.org/wiki/Prim%27s_algorithm

---

Very good benchmark case of vector vs list vs deque
https://baptiste-wicht.com/posts/2012/12/cpp-benchmark-vector-list-deque.html

---

Another Bit O Notation overview
https://www.youtube.com/watch?v=5yJ_QLec0Lc

---

A* algorithm overview, a modification on Dijcstra
https://www.youtube.com/watch?v=vP5TkF0xJgI
slightly-longer
https://www.youtube.com/watch?v=ySN5Wnu88nE

https://en.wikipedia.org/wiki/A*_search_algorithm

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

Dijkstra, for minimal spanning tree:
https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm#Using_a_priority_queue

Bellman-Ford

---

Binary Indexed Tree (Fenwick Tree)
https://en.wikipedia.org/wiki/Fenwick_tree
https://www.topcoder.com/community/competitive-programming/tutorials/binary-indexed-trees/
https://www.youtube.com/watch?v=v_wj_mOAlig  --- video

Segment Tree Range
https://en.wikipedia.org/wiki/Segment_tree
https://www.youtube.com/watch?v=Oq2E2yGadnU

---

Maximum subarray sum, Kadane's algorithm
https://en.wikipedia.org/wiki/Maximum_subarray_problem

---
