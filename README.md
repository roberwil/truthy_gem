# Truthy Gem

###### **Find nuget gem [here](#).**

### What is truthy anyway?

Well, think of truth table you just invented, you put your 1s and 0s and **Truthy** figures out which formula works
for the table.

| A   | B   | C   |
|-----|-----|-----|
| 0   | 0   | 1   |
| 1   | 0   | 1   |
| 1   | 1   | 0   |
| 0   | 1   | 0   |

If you create the above table with **Truthy**, it will know what to do so that your table makes sense.
Also, **Truthy** has implementations for the following logical gates: `and`, `or`, `not`,
`xor`, `nand`, `nor`, and `xnor`.

### Where can I use it?

- Access matrices are a good example;
- Other examples are just day-to-day comparisons you do with booleans in your code.

Why stress your brain with bare booleans? Use Truthy!

Let your imagination make good use of Truthy.

### Usage

Every functionality is under `ada_truthy` namespace. Some methods throw an exception, the `TruthyException`.

```ruby
require 'ada_truthy'
```

#### Truth Table

To create a truth table, you do as follows:

```ruby
t = TruthTable.new 2
```

2 is the number of terms in the truth table. The **minimum** number of terms is **2** and the **maximum** is **6**.
If you violate any of the limits, `TruthyException` will be raised.

To add a new row, you do as follows:

```ruby
t = TruthTable.new 2
t.add_row 1, 1, 0
```

For a truth table of **n** terms, the rows take **n+1** terms, where **+1** is the result of the operation for such row.
`TruthyException` will be raised if:

- There are already enough rows for the defined truth table;
- You try to add equal rows;
- You try to add a row with **m** terms, where **m != n + 1**.

After you have defined your truth table and added your rows, you can check boolean values against it as follows:

```ruby
t = TruthTable.new 2
t.add_row 1, 1, 0

t.check(2+2==4, 3+3==6) # > false
t.check(2+2==1, 3+3==6) # > true
```
For a truth table of **n** terms, you check **n** terms.

Beware of the behaviour of Truthy, see the following example to understand.

```ruby
t = TruthTable.new 2
t.add_row 1, 1, 0   # the other combinations will evaluate to true
t.check true, false # > true

u = TruthTable.new 2
u.add_row 1, 1, 0
u.add_row 1, 0, 1

u.check(true, true)  # > false
u.check(true, false) # > true

# the other combinations will evaluate to true
u.check(false, false) # > true
u.check(false, true)  # > true


w = TruthTable.new 2
w.add_row 1, 1, 0
w.add_row 1, 0, 0
w.add_row 0, 1, 1

w.check(true, true)  # > false
w.check(true, false) # > false
w.check(false, true) # > true

# the other combinations will evaluate to false
u.check(false, false) # > false
```

The tricks to master it are:
- The first row you add is determinant, take **table t**, if the first row was equal to 1, the the rest would be false;
- if there are more 0s than 1s explicitly (like **table w**), every combination that equals 0 and others not specified will evaluate to 0, which means, it could be simplified;
- if there are more 1s than 0s explicitly, every combination that equals 1 and others not specified will evaluate to 1.

At last, if you wish to know the formula, just call `.to_s`

```ruby
t = TruthTable.new 2
t.add_row(1, 1, 0)    # the other combinations will evaluate to true
t.check(true, false)  # > true

t.to_s # > (~A+~B)
```

#### Logical Gates

The logical gates are all found in the `LogicalGate` class, but there are also extension methods for booleans.
All operations support multiple terms and accept a minimum of 2 terms, except `.not()` which accepts only 1 term.

`.and` is equivalent to `&&`. Operation is `true` if every term is `true`.

```ruby
a = (2+2==4)
b = (2+1==3)
c = (2+1==5)

a.and(b)    # > true
a.and(b, c) # > false
```

`.or` is equivalent to `||`. Operation is `true` if any term is `true`.

```ruby
a = (2+2==4)
b = (2+1==3)
c = (2+1==5)

a.or(b)               # > true
a.or(b, c)            # > true
LogicalGate.or(c, c)  # > false
```

`.not` inverts the value.

```ruby
a = (2+2==4)
b = (2+1==3)
c = (2+1==5)

a.not()            # > false
LogicalGate.not(b) # > false
LogicalGate.not(c) # > true
```

`.xor` is the exclusive OR, the operation is true if the terms are different. XOR is a binary operation,
which means that if you test multiple terms, XOR will be applied for every two terms.
Example: 3 terms (a, b and c), first, we do a XOR b, and then (a XOR b) XOR c.

```ruby
a = (2+2==4)
b = (2+1==3)
c = (2+1==5)

a.xor(b) # > false
a.xor(c) # > true
```

`.nand` is the inverse of AND operation.

```ruby
a = (2+2==4)
b = (2+1==3)
c = (2+1==5)

a.nand(b)    # > false
a.nand(b, c) # > true
```

`.nor` is the inverse of OR operation.

```ruby
a = (2+2==4)
b = (2+1==3)
c = (2+1==5)

a.nor(b)             # > false
a.nor(b, c)          # > false
LogicalGate.or(c, c) # > true
```

`.xnor`is the inverse of XOR operation.

```ruby
a = (2+2==4)
b = (2+1==3)
c = (2+1==5)

a.xnor(b) # > true
a.xnor(c) # > false
```
