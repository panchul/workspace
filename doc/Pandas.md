[Home](Readme.md)
# Pandas (Python library)

See also:

  - [Anaconda](Anaconda.md)
  - [Jupyter](Jupyter.md)
  - [Matplotlib](Matplotlib.md)
  - [numpy](Numpy.md)
  - [PlotlyDash](PlotlyDash.md)
  - [Python](Python.md)


https://pandas.pydata.org/docs/

---

**Contents**

- [Miscellaneous](Pandas.md#miscellaneous)
- [Installing](Pandas.md#installing)

---

## Installing

---


---

## Miscellaneous

---

Merge, join, concatenate and compare

https://pandas.pydata.org/docs/user_guide/merging.html

https://realpython.com/pandas-merge-join-and-concat/#examples

---

Unique entries:

https://www.geeksforgeeks.org/how-to-count-distinct-values-of-a-pandas-dataframe-column/

---

Removing duplicates from a dataframe

```Python
import pandas as pd
data = {
    "A": ["TeamA", "TeamB", "TeamB", "TeamC", "TeamA"],
    "B": [50, 40, 40, 30, 50],
    "C": [True, False, False, False, True]
}
df = pd.DataFrame(data)
display(df.drop_duplicates())
```

```
     A        B    C
0    TeamA    50    True
1    TeamB    40    False
3    TeamC    30    False
```

---

Filtering dataframe by another dataframe

https://www.includehelp.com/python/how-to-filter-rows-from-a-dataframe-based-on-another-dataframe.aspx

```Python
# Importing pandas package
import pandas as pd

# Creating two dictionaries
d1 = {'Blood_group':['A+','B+','AB+','O+','O-','A-','B-']}
d2 = {'Blood_group':['O+','AB+','B-']}

# Creating two DataFrames
D1 = pd.DataFrame(d1)
D2 = pd.DataFrame(d2)

# Display the DataFrames
print("Original DataFrame 1:\n",D1,"\n\n")
print("Original DataFrame 2:\n",D2,"\n\n")

# Filtering Dataframe rows
result = D1[~(D1.Blood_group.isin(D2.Blood_group))]

# Display result
print("Result:\n",result)
```

---

## Miscellaneous

---


---
