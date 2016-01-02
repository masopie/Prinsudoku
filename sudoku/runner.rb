require_relative 'sudoku'

# The sudoku puzzles that your program will solve can be found
# in the sudoku_puzzles.txt file.
#
# Currently, Line 18 defines the variable board_string to equal
# the first puzzle (i.e., the first line in the .txt file).

# IMPORTANT:
# After your program can solve this first puzzle, edit
# the code below, so that the program tries to solve
# all of the puzzles.
#
# Remember, the file has newline characters at the end of each line,
# so we call String#chomp to remove them.

#Read the first puzzle
board_string = File.readlines('sudoku_puzzles.txt').first.chomp

#Run the board solver and get a board back
solved_board = solve(board_string)

#Print a pretty version of the board to the screen
puts pretty_board(solved_board)

#Print whether or not we succeeded
if solved?(solved_board)
  puts "Board solved!"
else
  puts "Board is not solvable!"
end
