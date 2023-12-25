[Home](Readme.md)
# Sorting 

See Also:
  - [STL](STL.md)
  - [AlgorithmsDataStructures](AlgorithmsDataStructures.md)
  - [Deque](Deque.md)
  - [List](List.md)
  - [Vector](Vector.md)
  - [Map](Map.md)
  - [Stack](Stack.md)

---

**Contents**

  - [Array/list sorting](Sorting.md#arraylist-sorting)
  - [Traversal/Search](Sorting.md#traversalsearch)
  - [Graph sorting](Sorting.md#graph-sorting)
  - [Classification](Sorting.md#classification)
    - [Stable sorting](Sorting.md#stable-sorting)
  - [Miscellaneous](Sorting.md#miscellaneous)

---

## Array/list sorting

---

 - Bucket https://en.wikipedia.org/wiki/Bucket_sort
   "Bucket sort, or bin sort, is a sorting algorithm that works by distributing the
    elements of an array into a number of buckets. Each bucket is then sorted
    individually, either using a different sorting algorithm, or by recursively
    applying the bucket sorting algorithm."
 
 - Insertion Sort https://en.wikipedia.org/wiki/Insertion_sort
 
 - Merge Sort https://en.wikipedia.org/wiki/Merge_sort
   Conceptually, a merge sort works as follows:
   Divide the unsorted list into n sublists, each containing one element (a list of one element is considered sorted).
   Repeatedly merge sublists to produce new sorted sublists until there is only one sublist remaining. This will be the sorted list.

 - Radix Sort https://en.wikipedia.org/wiki/Radix_sort
   "In computer science, radix sort is a non-comparative integer sorting algorithm that
   sorts data with integer keys by grouping keys by the individual digits which share
   the same significant position and value."
 
 - Timsort https://en.wikipedia.org/wiki/Timsort
 
 - Quicksort https://en.wikipedia.org/wiki/Quicksort
   Quicksort is a divide-and-conquer algorithm. It works by selecting a 'pivot' element from the array
   and partitioning the other elements into two sub-arrays, according to whether they are less than or greater
   than the pivot. For this reason, it is sometimes called partition-exchange sort. The sub-arrays are then
   sorted recursively. This can be done in-place, requiring small additional amounts of memory to perform the
   sorting.

---  

## Traversal/Search 

---

 - Breadth-first Search https://en.wikipedia.org/wiki/Breadth-first_search
 - Depth-first Search https://en.wikipedia.org/wiki/Depth-first_search

---

## Graph sorting

---

- https://en.wikipedia.org/wiki/Topological_sorting
-

---

## Classification

### Stable sorting.

A sorting algorithm is said to be stable if two objects with equal keys appear in the same order in sorted output
as they appear in the input unsorted array.

---

## Miscellaneous

---