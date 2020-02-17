# MapReduce

MapReduce is a programming model and an associated implementation for processing
and generating big data sets with a parallel, distributed algorithm on a cluster.
Basically, what all folding is about. Google papers made it a popular concept

https://en.wikipedia.org/wiki/MapReduce


MapReduce tasks must be written as acyclic dataflow programs, i.e. a stateless
mapper followed by a stateless reducer, that are executed by a batch job scheduler.
This paradigm makes repeated querying of datasets difficult and imposes limitations
that are felt in fields such as machine learning, where iterative algorithms that
revisit a single working set multiple times are the norm.

---
