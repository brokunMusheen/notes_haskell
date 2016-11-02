# Chapter 1: Starting Out
This chapter goes through basic Haskell syntax and introduces:
* [Functions](## Functions)
* [Definitions or Names](## Definitions-or-Names)
* [Lists](## Lists)
* [Strings](## Strings)
* [Ranges](## Ranges)
* [List Comprehensions](## List-Comprehensions)
* [Tuples](## Tuples)

## Basic Syntax
```haskell
{- Simple Arithmetic
-}

8 + 17
-- 25

9 - 6
-- 3

2 * 4
-- 8

8 / 4
-- 2

(5 * 3) + 7
-- 105

5 * (3 + 7)
-- 50

5 + 4.0
-- 9.0


{- Boolean Operations
-}
True && False
-- False

True || False
-- True

not True
-- False

not (True && False)
-- True

{- Boolean Expressions
-}
5 == 5
-- True

5 /= 5
-- False

"hello" == "hello"
-- True


{- Function Precedence

   Function application has the highest precedence.

   Precedence can be altered by using parenthesis.
-}

succ 9 * 10
-- 100

succ (9 * 10)
-- 91


{- Infix vs Prefix

   By default, all user defined functions are used called using prefix notation. To use infix notation, use back-ticks (`). Infix vs prefix notation is purely a readability concern, as it does not affect function
-}

div 92 10
-- 9

92 `div` 10
-- 9

{- In Haskell, every "if" is an expression that requires an "else" clause - the "if" must return a value!
-}

contrived num = if num < 10
                then "low"
                else "high"
```

## Functions
See `doubleFunctions.hs` for the following function declaration examples:
* `doubleMe`
    * `doubleMe 2` => 4
* `doubleUs`
    * `doubleUs 2 3` => 10
* `doubleUs'`
    * `doubleUs' 2 3` => 10
* `doubleSmallNumber`
    * `doubleSmallNumber 2` => 4
    * `doubleSmallNumber 102` => 102

Within GHCi, we have to use `let` to declare functions

```haskell
let doubleMe x = x * 2
```

## Definitions or Names
Functions without parameters are referred to as **definitions** or **names**.

```haskell
foo = "bar"
```

## Lists
Lists are similar to arrays in imperative languages.

```haskell
{- Basic List Declaration
-}
[1, 2, 3]

{- List concatenation

   Expense warning: this requires that both lists be "walked" through.
-}
[1, 2, 3] ++ [4, 5, 6]
-- [1, 2, 3, 4, 5, 6]

{- Add elements to beginning of list (cons)

   This happens in constant time, regardless of list size.
-}
1 : [2, 3]
-- [1, 2, 3]
```

### Empty Lists
`[]` denotes an empty list

Every list contains the empty list - `[1, 2, 3]` is syntactically identical to `1:2:3:[]`

`[]`, `[[]]` and `[[], []]` are all different - no two are identical

### List Indices
```haskell
[1, 2, 4] !! 1
-- 2
```

### List Comparison
When comparing lists, each element pair is compared in sequence. When a result is found, comparison stops and the result is returned.

```haskell
[2, 3, 1] < [2, 3, 8]
-- True

[3, 3, 0] > [2, 3, 1000]
-- True
```

### Built-in List Functions
```haskell
{- head returns the first element of a list
-}
head [1, 2, 3]
-- 1

{- tail returns the elements of a list following the head
-}
tail [1, 2, 3]
-- [2, 3]

{- init returns the elements of a list preceding the last element
-}
init [1, 2, 3]
-- [1, 2]

{- last returns the last element of a list
-}
last [1, 2, 3]
-- 3

{- length returns the list length
-}
length [1, 2, 3]
-- 3

{- null returns True if list is empty - False, otherwise
-}
null [1, 2, 3]
-- False
null []
-- True

{- reverse ...reverses the list
-}
reverse [1, 2, 3]
-- [3, 2, 1]

{- take gets up to the first n-many elements from a list
-}
take 2 [1, 2, 3, 4, 5]
-- [1, 2]
take 5 [1, 2, 3]
-- [1, 2, 3]

{- drop removes up to n-many elements from the beginning of a list
-}
drop 2 [1, 2, 3]
-- [3]
drop 100 [1, 2, 3]
-- []

{- elem returns True or False, depending on whether the supplied element exists in the list.
-}
elem 2 [1, 2, 3]
-- True
elem 8 [1, 2, 3]
-- False
```

## Strings
Strings are just lists of characters and can be used as such

`"foo"` is identical to `'f':'o':'o':[]`

```haskell
take 3 "Haskell"
-- "Has"
```

## Ranges
Ranges are simple list shorthand

```haskell
[1..4]
-- [1, 2, 3, 4]

['a'..'d']
-- "abcd"

[2, 4..10]
-- [2,4,6,8,10]

[4..1]
-- []

[4,3..1]
-- [4,3,2,1]

[2,4..2*5]
-- [2,4,6,8,10]
```

### Infinite Lists
Infinite ranges can be utilized due to Haskell's *laziness*.
* Infinite list of all even numbers >= 2: `[2, 4..]`

```haskell
take 6 [2, 4..]
-- [2,4,6,8,10,12]
```

See `cycle`, `repeat` and `replicate`

## List Comprehensions
List Comprehensions are related to mathematical set comprehensions, and are used to defined more complex lists.

Example:
* the `<-` "draws" elements from the list to `x`
* the `x <- [2,4..10]` is the predicate
* `2 * x` is the "output"
* the `|` "binds" the predicate values to the output
* multiple predicates can be supplied by separating them with a comma
```haskell
[2 * x | x <- [2,4..10]]
-- [4,8,12,16,20]

-- Same as above, only defined using predicate constraints
[2 * x | x <- [1..10], even x]
-- [4,8,12,16,20]

-- Multiple list can be used. Every permutation of the lists is used within the
-- output in a well-defined order.
[[x,y] | x <- [1..2], y <- [100,99..98]]
-- [[1,100],[1,99],[1,98],[2,100],[2,99],[2,98]]
```

List comprehension nesting is also supported

## Tuples
Tuples are heterogenous sets of data and are defined by using parenthesis and separating values with a comma.

A tuple is defined by its size, as well as the types of its values.

### Common Tuple Names
* A *pair* is a tuple of size 2
    * `('a', 1)`
* A *triple* is a tuple of size 3
    * `(1, "Cat", "Roger")`

See `rightTriangle.hs` for an example using tuples with list comprehensions.
* `rightTriangleSides` => `[(8,6,10)]`
