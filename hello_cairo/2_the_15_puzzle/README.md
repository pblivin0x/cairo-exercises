# The 15-puzzle

The 15-puzzle is a well-known game in which you are given a frame of 4x4 tiles where one of the tiles is missing, and the other are numbered 1-15. You have to slide tiles into the “hole” until you reach the “solved” configuration, in which the numbers are ordered.

We will show how to write a Cairo program verifying a solution to the 15-puzzle (the initial state will be an input) thus allowing you to prove that you know the solution to that initial state (without necessarily revealing the solution to the person verifying the proof!).

