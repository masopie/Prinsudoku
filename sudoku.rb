#Takes a board as a string in the format
#you see in the puzzle file. Returns
#something representing a board after
#your solver has tried to solve it.
def solve(board_string)
end

#Returns a boolean indicating whether
#or not the provided board is solved.
#The provided board will be in whatever
#form `solve` returns.
def solved?(board)
end

#Takes in a board in some form and
#returns a string that's well formatted
#for output to the screen. No `puts` here!
#The provided board will be in whatever
#form `solve` returns.
def pretty_board(board)
  pretty_board = ''
  board.each_slice(9) do |row|
    row.each_with_index do |cell, index|
      pretty_row = ''
      if cell.length > 1
        pretty_row += row[index] = '-'
      end
    end
  pretty_board += row.join('  ') + "\n"
  end
  pretty_board
end

#Takes in a board in some form and
#returns a string in the same format
#as you see in the puzzle file.
#The provided board will be in whatever
#form `solve` returns.
def board_to_string(board)
  string_board = ''
  board.each do |cell|
    if cell.length > 1
      string_board << "-"
    else
      string_board << cell.join("")
    end
  end
  string_board
end

test_board = [
  [1],[2],[3],[4],[5],[6],[7],[8],[9],
  [1],[2,4],[3],[4],[5],[6],[7],[8],[9],
  [1],[2],[3,5],[4],[5],[6],[7],[8],[9],
  [1],[2],[3],[4,7],[5],[6],[7],[8],[9],
  [1],[2],[3],[4],[5,8],[6],[7],[8],[9],
  [1],[2],[3],[4],[5],[6,9],[7],[8],[9],
  [1],[2],[3],[4],[5],[6],[7,9,1,3],[8],[9],
  [1],[2],[3],[4],[5],[6],[7],[5,6],[9],
  [1],[2],[3],[4],[5],[6],[7],[8],[9,5]
]

p pretty_board(test_board)
p board_to_string(test_board)
