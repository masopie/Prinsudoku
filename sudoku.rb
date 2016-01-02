def can_see_row(cell_number)
  (0..80).to_a.select { |num| num/9 == cell_number/9}
end

def can_see_column(cell_number)
  (0..80).to_a.select { |num| num % 9 == cell_number % 9}
end

def can_see_block(cell_number)
  (0..80).to_a.select { |num|
    num/27 == cell_number/27 && (num/3)%3 == (cell_number/3)%3
  }
end

def big_array(board_string)
  mother_array = board_string.chars
end

def calculate_cells_cell_can_see(cell_number)
  cells_can_see = []
  cells_can_see << can_see_row(cell_number)
  cells_can_see << can_see_column(cell_number)
  cells_can_see << can_see_block(cell_number)
  cells_can_see.flatten.uniq - [cell_number]
end

def initialize_cell_info(board_string)
 board_string.chars.each_with_index.map { |x, ind|
    cell_hash = {}
    cell_hash[:possible_values] = x == '-' ? (1..9).to_a : [x.to_i]
    cell_hash[:can_see] = calculate_cells_cell_can_see(ind)
    cell_hash
  }
end

def remove_possible_values(cell, hash_array)
  cell[:can_see].each do |seen_cell|
    if hash_array[seen_cell][:possible_values].length == 1
      cell[:possible_values].delete(hash_array[seen_cell][:possible_values][0])
    end
  end
  cell
end

def last_iterations_same?(poss_val_qty, board2)
  curr_poss_val = board2.map do |cell|
    cell[:possible_values].length
  end
  poss_val_qty == curr_poss_val
end

#Takes a board as a string in the format
#you see in the puzzle file. Returns
#something representing a board after
#your solver has tried to solve it.
def solve(board_string)
  cell_info = initialize_cell_info(board_string)
  last_cell_info_poss = Array.new(81) {Array.new}
  while !solved?(cell_info) && !last_iterations_same?(last_cell_info_poss, cell_info) do
    last_cell_info_poss = cell_info.map do |cell|
      cell[:possible_values].length
    end
    cell_info = cell_info.each do |cell|
      if cell[:possible_values].length > 1
        remove_possible_values(cell, cell_info)
      end
    end
  row_check(cell_info) if !solved?(cell_info)
  column_check(cell_info) if !solved?(cell_info)
  block_check(cell_info) if !solved?(cell_info)
  end
# puts cell_info


cell_info
end

# ITERATE over each row
# -Select cell numbers to be part of row by cellnum/9
# -ASSIGN a variable to hold necessary values, array of 1 to 9
# -ITERATE over cell numbers in row
# --CHECK each member to see length of possible values array
# ---Remove values from necessary array if length of poss vals == 1
# ---ELSE add cell number to array of undetermined cells
# -end iteration
# -ITERATE over remainder of necessary values array
# --CHECK each member of undetermined cells
# ---IF undetermined value is only possible in one of the undetermined cells, assign it to that cell
# ----cellnum[:possible_values] = [value]
# -end iteration
# end iteration
# iterate over columns...
#   iterate over blocks...


def row_check(board_values)
  (0..8).each do |row|
    row_cells = can_see_row(row * 9)
    uncertain_values = (1..9).to_a
    uncertain_cells = []
    row_cells.each do |cell|
      if board_values[cell][:possible_values].length > 1
        uncertain_cells << cell
      else
        uncertain_values.delete(board_values[cell][:possible_values][0])
      end
    end
    uncertain_values.each do |val|
      real_cell = uncertain_cells.select do |cell|
        board_values[cell][:possible_values].include? val
      end
      if real_cell.length == 1
        board_values[real_cell[0]][:possible_values] = [val]
      end
    end
  end
end

def column_check(board_values)
  (0..8).each do |col|
    col_cells = can_see_column(col * 9)
    uncertain_values = (1..9).to_a
    uncertain_cells = []
    col_cells.each do |cell|
      if board_values[cell][:possible_values].length > 1
        uncertain_cells << cell
      else
        uncertain_values.delete(board_values[cell][:possible_values][0])
      end
    end
    uncertain_values.each do |val|
      real_cell = uncertain_cells.select do |cell|
        board_values[cell][:possible_values].include? val
      end
      if real_cell.length == 1
        board_values[real_cell[0]][:possible_values] = [val]
      end
    end
  end
end

def block_check(board_values)
  [0,3,6,27,30,33,54,57,60].each do |block|
    block_cells = can_see_block(block * 9)
    uncertain_values = (1..9).to_a
    uncertain_cells = []
    block_cells.each do |cell|
      if board_values[cell][:possible_values].length > 1
        uncertain_cells << cell
      else
        uncertain_values.delete(board_values[cell][:possible_values][0])
      end
    end
    uncertain_values.each do |val|
      real_cell = uncertain_cells.select do |cell|
        board_values[cell][:possible_values].include? val
      end
      if real_cell.length == 1
        board_values[real_cell[0]][:possible_values] = [val]
      end
    end
  end
end

#Returns a boolean indicating whether
#or not the provided board is solved.
#The provided board will be in whatever
#form `solve` returns.
def solved?(board)
  return board.all? do |cell|
    cell[:possible_values].length == 1
  end
end

#Takes in a board in some form and
#returns a string that's well formatted
#for output to the screen. No `puts` here!
#The provided board will be in whatever
#form `solve` returns.
def pretty_board(board)

  sud_array = board_to_string(board).split("")
  str = ""
  3.times do
    str += "||===|===|===||===|===|===||===|===|===||\n"
    2.times do
      str += "|| #{sud_array.shift} | #{sud_array.shift} | #{sud_array.shift} || #{sud_array.shift} | #{sud_array.shift} | #{sud_array.shift} || #{sud_array.shift} | #{sud_array.shift} | #{sud_array.shift} ||\n"
      str += "||---|---|---||---|---|---||---|---|---||\n"
    end
    1.times do
      str += "|| #{sud_array.shift} | #{sud_array.shift} | #{sud_array.shift} || #{sud_array.shift} | #{sud_array.shift} | #{sud_array.shift} || #{sud_array.shift} | #{sud_array.shift} | #{sud_array.shift} ||\n"
    end
  end
  str += "||===|===|===||===|===|===||===|===|===||"
end

#Takes in a board in some form and
#returns a string in the same format
#as you see in the puzzle file.
#The provided board will be in whatever
#form `solve` returns.
def board_to_string(board)
  return board.reduce("") do |str, cell|
    str += cell[:possible_values].length > 1 ? "-" : cell[:possible_values][0].to_s
  end
end
