#Takes a board as a string in the format
#you see in the puzzle file. Returns
#something representing a board after
#your solver has tried to solve it.
def solve(string)
  board = string_to_board(string)
  while solved?(string) == false
    board.each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        if cell == "-"
          replace_value(board, row_index, col_index,check_cell(board,row_index,col_index))
          string = board_to_string(board)
        end
      end
    end
  end
  return board_to_string(board)
end

#Returns a boolean indicating whether
#or not the provided board is solved.
#The provided board will be in whatever
#form `solve` returns.
def solved?(board)
  board.include?("-") ? false : true
end

#Takes in a board in some form and
#returns a string that's well formatted
#for output to the screen. No `puts` here!
#The provided board will be in whatever
#form `solve` returns.
def pretty_board(board)
end

#Takes in a board in some form and
#returns a string in the same format
#as you see in the puzzle file.
#The provided board will be in whatever
#form `solve` returns.
def board_to_string(board)
  board.flatten.join
end

def string_to_board(string)
  string.split(//).each_slice(9).to_a
end

def make_row(array, row_number)
  array[row_number]
end

def make_column(array, column_number)
  column = []
  array.each do |row|
    column << row[column_number]
  end
  column
end

def square_range(row, column)
  square_column1 = [0,3,6]
  square_column2 = [1,4,7]
  square_column3 = [2,5,8]
  index = 0 if row >= 0 && row <= 2
  index = 1 if row >= 3 && row <= 5
  index = 2 if row >= 6 && row <= 8
  array = square_column1 if column >= 0 && column <= 2
  array = square_column2 if column >= 3 && column <= 5
  array = square_column3 if column >= 6 && column <= 8
  array[index]
end

def identify_and_make_square(array, square_number)
  square_coor = {
    0 => [0,0], 1 => [0,3], 2 => [0,6],
    3 => [3,0], 4 => [3,3], 5 => [3,6],
    6 => [6,0], 7 => [6,3], 8 => [6,6]
  }
  make_square(array, square_coor[square_number])
end

def make_square(array, array_of_coordinates)
  square_array = []
  row_start = array_of_coordinates[0]
  row_end = row_start + 2
  column_start = array_of_coordinates[1]
  column_end = column_start + 2
  counter = row_start
  while counter <= row_end
    square_array << array[counter][column_start..column_end]
    counter += 1
  end
  square_array.flatten
end

def possible_values(array)
  return_array = ["1","2","3","4","5","6","7","8","9"]
  return_array_dup = return_array.dup
  return_array_dup.each do |return_array_value|
    if array.include?(return_array_value)
      return_array.delete(return_array_value)
    end
  end
  return_array.sort
end

def check_cell(board,row,column)
  row_return_values = possible_values(make_row(board,row))
  col_return_values = possible_values(make_column(board,column))
  square_number = square_range(row,column)
  square_return_values = possible_values(identify_and_make_square(board,square_number))
  uniq_val = row_return_values & col_return_values & square_return_values
  if uniq_val.length == 1
    return uniq_val[0]
  else
    return false
  end
end

def replace_value(board, row, column, answer)
  if answer
    board[row][column] = answer
  end
  board
end

solve("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")

# solve("--5-3--819-285--6-6----4-5---74-283-34976---5--83--49-15--87--2-9----6---26-495-3")


