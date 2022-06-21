# Programming in Cairo: Your first function

## Running the code

cairo-compile array_sum.cairo --output array_sum_compiled.json

cairo-run --program=array_sum_compiled.json \
    --print_output --layout=small

## Notes

+ Cairo is not a high-level language
    + It is a low-level language with some powerful syntactic sugar to allow writing maintainable code
    + Advantage: efficiency, can write almost anything that can run on the Cairo machine
    + Disadvantage: have to avoid common mistakes
+ Recursion, not loops
    + Main reason for this is that Cairo memory is immutable
        + Once you write the value of a memory cell, this cell cannot change in the future
    + Similar to pure funcitonal languages, whose objects are also immutable
+ Loops in some sense are possible in Cairo
    + Cannot call funcitons inside a loop
    + More complicated to implement
    + Advantage: tend to be more efficient than recursion