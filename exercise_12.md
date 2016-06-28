# First and Follow Sets

|   Symbol      |    First Set  |       Follow Set         |
| ------------- |---------------|--------------------------|
| A             |       ε       |                        a |
| B             |       a       |                  a, b, $ |
| C             |       e, ε    |                        f |
| S             |       ε, a    |                        $ |




# SLR(1)-Table


|Goto	    |Kernel	            |State	|Closure|
|-----------|-------------------|-------|-------|
|           | {S -> .A B $}	    |0|	{S -> .A B $; A -> .}|
|goto(0, A) | {S -> A.B $}	    |1|	{S -> A.B $; B -> .a B B b; B -> .a C f}|
|goto(1, B) | {S -> A B.$}	    |2|	{S -> A B.$}|
|goto(1, a) | {B -> a.B B b; B -> a.C f}|3|	{B -> a.B B b; B -> a.C f; B -> .a B B b; B -> .a C f; C -> .e; C -> .}|
|goto(2, $) | {S -> A B $.}     |4|	{S -> A B $.}|
|goto(3, B) | {B -> a B.B b}	|5|	{B -> a B.B b; B -> .a B B b; B -> .a C f}|
|goto(3, C) | {B -> a C.f}	    |6|	{B -> a C.f}|
|goto(3, a) | {B -> a.B B b; B -> a.C f}|3|     |
|goto(3, e) | {C -> e.}	        |7|	{C -> e.}   |
|goto(5, B) | {B -> a B B.b}	|8|	{B -> a B B.b}|
|goto(5, a) | {B -> a.B B b; B -> a.C f}|3|     |
|goto(6, f) | {B -> a C f.}	    |9 |{B -> a C f.}|
|goto(8, b) | {B -> a B B b.}	|10|{B -> a B B b.}|



## Anlayse 'a a f a e f b $'

|  |      |                        |   |
|--|------|------------------------|---|
|1 |	0 |	a a f a e f b $ $	|r1	|
|2 |	0 A |	a a f a e f b $ $|	1|
|3 |	0 A 1 |	a a f a e f b $ $|	s3|
|4 |	0 A 1 a 3 |	a f a e f b $ $|	s3|
|5 |	0 A 1 a 3 a 3 |	f a e f b $ $|	r5|
|6 |	0 A 1 a 3 a 3 C |	f a e f b $ $|	6|
|7 |	0 A 1 a 3 a 3 C 6 |	f a e f b $ $|	s9|
|8 |	0 A 1 a 3 a 3 C 6 f 9 |	a e f b $ $ |	r3|
|9 |	0 A 1 a 3 B |	a e f b $ $ |	5|
|10|	0 A 1 a 3 B 5 |	a e f b $ $ |	s3|
|11|	0 A 1 a 3 B 5 a 3 |	e f b $ $ |	s7|
|12|	0 A 1 a 3 B 5 a 3 e 7 |	f b $ $ |	r4|
|13|	0 A 1 a 3 B 5 a 3 C |	f b $ $ |	6|
|14|	0 A 1 a 3 B 5 a 3 C 6 |	f b $ $|s9|
|15|	0 A 1 a 3 B 5 a 3 C 6 f 9 |	b $ $|r3|
|16|	0 A 1 a 3 B 5 B	|$ $ |	8|
|17|	0 A 1 a 3 B 5 B 8 |	b $ $|s10|
|18|	0 A 1 a 3 B 5 B 8 b 10 |	$ $|r2|
|19|	0 A 1 B |	$ $|2|
|20|	0 A 1 B 2 |	$ $ |	s4|
|21|	0 A 1 B 2 $ 4 |	$ |	end |