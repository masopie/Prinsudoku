# Sudoku

## Learning Competencies

* Model a simple real-world system in Ruby code
* Use Pseudocode effectively to model problem-solving

## Summary

By the end of this challenge you'll have a fully-functioning Sudoku solver that you can run from the command line.

[Sudoku](http://en.wikipedia.org/wiki/Sudoku) is a logic-based, combinatorial number-placement puzzle. The objective is to fill a 9×9 grid with digits so that each column, each row, and each of the nine 3×3 sub-grids that compose the grid (also called "boxes") contains the digits from 1 to 9.

Generally, a puzzle provides a partial solution so that some squares already have numbers.  To solve the puzzle, you fill in the unsolved squares.

![Unsolved](http://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Sudoku-by-L2G-20050714.svg/250px-Sudoku-by-L2G-20050714.svg.png) ![Solved Sudoku](http://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Sudoku-by-L2G-20050714_solution.svg/250px-Sudoku-by-L2G-20050714_solution.svg.png)

In this challenge, you are presented with **15** unsolved Sudoku puzzles.  The puzzles can be found in the `source/sudoku_puzzles.txt` file.  

* Five puzzles can be solved with **basic logic**.
* Five require slightly more **advanced logic**.  
* Five require **educated guessing**.  
* A complete solution will solve **all 15 puzzles**.

## Pre-releases 
### Modeling: The Language of Sudoku

A computer program that solves Sudoku is simulating the *player*, which means the better you can empathize with the player the more likely you'll understand how to write a Sudoku solver. What are the names of various parts of the Sudoku puzzle? What are the actions a player takes when solving a Sudoku puzzle?

Understanding the person playing the game is key.  What is the player doing when solving a Sudoku puzzle?

### Modeling: Strategies for Humans

Get out an actual Sudoku puzzle, printed on a piece of paper. Play it with your group. Pay attention to yourself and to each other.

1. What strategies are you adopting and why?
2. How do you choose where to start?
3. How do you know when to really put a number in a square?
4. What do you do when you don't definitively know how to fill in any more squares?

As you reflect on your human strategy, it's important to see that sometimes the strategies that work for *humans* might not be easy to implement on a computer. *And vice versa*, computers might have an easy time using strategies we avoid because we'd have to write too much, use too many sheets of paper, or remember too much information.

### Modeling: Strategies for Computers

Before you begin coding, develop and write a pseudocode solution for your solver.

## Important: Restrictions

**Failing to follow these rules will result in an invalid submission.**

The following restrictions are in place as you work on this challenge:

 * Do not create classes, you are only creating methods
 * No instance variables and no globals, you will only use local variables

You will be writing methods that accept arguments and return values to build your solver.

## Testing
Good news: you will be creating many small methods, and small methods are easier to test. 

The number of tests you write is completely up to you. Testing is for _you_, and will help you develop code. You _must_ balance testing with the need to write code and make progress on the solution.

## Releases
### Release 0 : Basic Logic
Write a Sudoku solver that solves the **first five puzzles**.

The first five puzzles can be solved with basic logic, that is, identifying when a square has only one possible value.

For Release 0, your `solve` method should give up if it gets stuck.

#### Methods
You will be writing many methods to solve Sudoku, but here are a few that definitely need to exist.

The form your board takes as you pass it around is up to you, but certain methods will need to turn it into a string in the puzzle format, or a string suitable for output to the screen.

##### Method: `solve`
The `solve` method will take a puzzle in as a string from the puzzle file. It will return a board in some form after your program has solved it (or done the best it could).

**Do not stick everything inside** `solve`**!** Break your problem apart into _small methods_. Combine your smaller methods into bigger methods. This is known as *function composition* and it's a critical to managing complexity of your code. 

##### Method: `solved?`
Your `solved?` method should accept a board in whatever form you're using and return true or false based on whether the board is solved.

##### Method: `board_to_string`
`board_to_string` should take in a board in whatever format you're using and return a string in the same format you see in the puzzle file. No `puts` statements, it just returns a string.

##### Method: `pretty_board`
`pretty_board` should take in a board in some form and a return a string that's well formatted for output to the screen. No `puts` here either!
  
Your `pretty_board` method might yield something like this when it's printed.

```
1 - 5 8 - 2 - - -
- 9 - - 7 6 4 - 5
2 - - 4 - - 8 1 9
- 1 9 - - 7 3 - 6
7 6 2 - 8 3 - 9 -
- - - - 6 1 - 5 -
- - 7 6 - - - 3 -
4 3 - - 2 - 5 - 1
6 - - 3 - 8 9 - -
```

##### The Runner
Open the driver code provided in the `source/runner.rb` file to see how your code will be run.

As you can see in `runner.rb`, your `solve` method will receive a string from the puzzle file representing the Sudoku board as its argument.

Unsolved squares are marked with a `"-"`. Solved squares have a character from `"1"` to `"9"`.

For example:

`"1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"`

### Release 1 :  More Advanced Logic

**Improve your Sudoku solver to solve the next five puzzles.**

Puzzles 6 - 10 can be solved using logic alone but require more than just identifying when a square has only one possible value.

The `solve` method should still give up if it gets stuck.

### Release 2:  Educated Guessing

**Improve your Sudoku solver to solve all of the puzzles.**

Puzzles 11 - 15 can be solved by making informed guesses about the values of squares and then trying to solve the puzzles based on those guessed values.

Guessing should be started once your `solve` method gets stuck.  In other words, solve as many squares as possible using logic and then start guessing.
