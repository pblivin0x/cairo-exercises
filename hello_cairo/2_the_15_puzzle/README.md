# The 15-puzzle

The 15-puzzle is a well-known game in which you are given a frame of 4x4 tiles where one of the tiles is missing, and the other are numbered 1-15. You have to slide tiles into the “hole” until you reach the “solved” configuration, in which the numbers are ordered.

We will show how to write a Cairo program verifying a solution to the 15-puzzle (the initial state will be an input) thus allowing you to prove that you know the solution to that initial state (without necessarily revealing the solution to the person verifying the proof!).

## Running the code

```
cairo-compile puzzle_exercise.cairo --output puzzle_exercise_compiled.json
```

```
cairo-run --program=puzzle_exercise_compiled.json --print_output --layout=small
```

## Notes

+ The scope of a temporary variable is restricted
    + A temporary varible may be revoked due to jumps (e.g., if statements) or function calls
    + This is one of the delicate points of Cairo
+ Cairo does not have the < operator, but is does have a builtin called range-check that allows comparing values
+ Unlike high-level languages in which the return statement is implicit, you must explicitly use return() at the end of the function even if there are no return values
+ Local variables are similar to temporary variables, bu the scope in which they can be accessed is much less restricted
    + You can access them starting from theirr definition up to the end of the function
    + Line alloc_locals is part of Cairo's local mechanism
        + Allocates memory required for the local variables function 
        + Usually, this should be the first statement in a function which uses local variables
+ Cairo is an explicit language - is most cases it doesn't automatically add instructions unless the code explicitly says so
+ A reference is defined using a let statement
    + Ex: x = y * y * y
    + x is an alias to the expression y * y * y
    + Thus the instruction let x = y * y * y will not cause any computation to be performed
    + assert x * x = 1 will turn into assert (y * y * y) * (y * y * y) = 1
    + The scope which a reference is defined is derived from the scope in which the aliased expression is derived
+ Temporary and local variables are special cases of a reference
    + They point to a specific memory cell, which stores the result of a computation
    + Thus the statement tempvar x = y * y * y will invoke the computation, and x will be an alias to the memory cell containing the result, rather than the expression y * y * y
+ Temporary variables 
    + do not require prior allocation of memory
    + scope is restricted
+ Local variables 
    + are placed at the beginning of the function stack
        + so they require prior allocation using the instruction alloc_locals 
    + can be accessed throughout the entire execution of the function
+ The scope of the result of a function call is similar to that of a temporary variable
    + If you need to access the returned value later, you should copy the result to a local variable
+ If you get an error that your temporary variable was revoked, you can try to make it a local variable instead
+ Tuples are ordered, finite lists that can contain any combination of valid types