## Installing z3 and its Python interface

```
pip install z3-solver
```

To test
```
$ python    
...     
>>> from z3 import *      
>>> s = Solver()
>>> s.check()       
sat      
````  
