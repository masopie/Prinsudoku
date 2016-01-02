require_relative 'sudoku'

describe "solved?" do
  solved_puzzle = "1" * 81
  blank_puzzle = "-" * 81
  unsolved_puzzle = "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"

  it "return true if board is solved" do
    expect(solved?(solved_puzzle)).to eq(true)
  end

  it "return false if board is empty" do
    expect(solved?(blank_puzzle)).to eq(false)
  end

  it "returns false if board is unsolved" do
    expect(solved?(unsolved_puzzle)).to eq(false)
  end
end

describe "string_to_board" do
  string = "1--1--1--1--1--1--1--1--1--"
  unsolved_puzzle = "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"
  correct_board = [
    ["1", "-", "5", "8", "-", "2", "-", "-", "-"],
    ["-", "9", "-", "-", "7", "6", "4", "-", "5"],
    ["2", "-", "-", "4", "-", "-", "8", "1", "9"],
    ["-", "1", "9", "-", "-", "7", "3", "-", "6"],
    ["7", "6", "2", "-", "8", "3", "-", "9", "-"],
    ["-", "-", "-", "-", "6", "1", "-", "5", "-"],
    ["-", "-", "7", "6", "-", "-", "-", "3", "-"],
    ["4", "3", "-", "-", "2", "-", "5", "-", "1"],
    ["6", "-", "-", "3", "-", "8", "9", "-", "-"]
  ]

  it "returns an array" do
    expect(string_to_board(string)).to eq([["1", "-", "-", "1", "-", "-", "1", "-", "-"], ["1", "-", "-", "1", "-", "-", "1", "-", "-"], ["1", "-", "-", "1", "-", "-", "1", "-", "-"]])
  end

  it "returns an array of a full board" do
    expect(string_to_board(unsolved_puzzle)).to eq(correct_board)
  end
end

describe "board_to_string" do
  unsolved_puzzle = "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"
  correct_board = [
    ["1", "-", "5", "8", "-", "2", "-", "-", "-"],
    ["-", "9", "-", "-", "7", "6", "4", "-", "5"],
    ["2", "-", "-", "4", "-", "-", "8", "1", "9"],
    ["-", "1", "9", "-", "-", "7", "3", "-", "6"],
    ["7", "6", "2", "-", "8", "3", "-", "9", "-"],
    ["-", "-", "-", "-", "6", "1", "-", "5", "-"],
    ["-", "-", "7", "6", "-", "-", "-", "3", "-"],
    ["4", "3", "-", "-", "2", "-", "5", "-", "1"],
    ["6", "-", "-", "3", "-", "8", "9", "-", "-"]
  ]
  it "returns a string" do
    expect(board_to_string(correct_board)).to eq(unsolved_puzzle)
  end
end

describe "make row" do
  correct_board = [
    ["1", "-", "5", "8", "-", "2", "-", "-", "-"],
    ["-", "9", "-", "-", "7", "6", "4", "-", "5"],
    ["2", "-", "-", "4", "-", "-", "8", "1", "9"],
    ["-", "1", "9", "-", "-", "7", "3", "-", "6"],
    ["7", "6", "2", "-", "8", "3", "-", "9", "-"],
    ["-", "-", "-", "-", "6", "1", "-", "5", "-"],
    ["-", "-", "7", "6", "-", "-", "-", "3", "-"],
    ["4", "3", "-", "-", "2", "-", "5", "-", "1"],
    ["6", "-", "-", "3", "-", "8", "9", "-", "-"]
  ]

  it "returns a single row from board" do
    expect(make_row(correct_board, 0)).to eq(correct_board[0])
  end
end

describe "make column" do
  correct_board = [
    ["1", "-", "5", "8", "-", "2", "-", "-", "-"],
    ["-", "9", "-", "-", "7", "6", "4", "-", "5"],
    ["2", "-", "-", "4", "-", "-", "8", "1", "9"],
    ["-", "1", "9", "-", "-", "7", "3", "-", "6"],
    ["7", "6", "2", "-", "8", "3", "-", "9", "-"],
    ["-", "-", "-", "-", "6", "1", "-", "5", "-"],
    ["-", "-", "7", "6", "-", "-", "-", "3", "-"],
    ["4", "3", "-", "-", "2", "-", "5", "-", "1"],
    ["6", "-", "-", "3", "-", "8", "9", "-", "-"]
  ]
  column = ["1","-","2","-","7","-","-","4","6"]

  it "returns a single column from board" do
    expect(make_column(correct_board, 0)).to eq(column)
  end
end

describe "identify and make square" do
  correct_board = [
    ["1", "-", "5", "8", "-", "2", "-", "-", "-"],
    ["-", "9", "-", "-", "7", "6", "4", "-", "5"],
    ["2", "-", "-", "4", "-", "-", "8", "1", "9"],
    ["-", "1", "9", "-", "-", "7", "3", "-", "6"],
    ["7", "6", "2", "-", "8", "3", "-", "9", "-"],
    ["-", "-", "-", "-", "6", "1", "-", "5", "-"],
    ["-", "-", "7", "6", "-", "-", "-", "3", "-"],
    ["4", "3", "-", "-", "2", "-", "5", "-", "1"],
    ["6", "-", "-", "3", "-", "8", "9", "-", "-"]
  ]
  correct_square = ["8", "-", "2","-", "7", "6","4", "-", "-"]
  correct_square_7 = ["6", "-", "-","-", "2", "-","3", "-", "8"]
  it "returns a correct square (1)" do
    expect(identify_and_make_square(correct_board,1)).to eq(correct_square)
  end

    it "returns a correct square(7)" do
    expect(identify_and_make_square(correct_board,7)).to eq(correct_square_7)
  end
end

describe "square range" do
  correct_board = [
    ["1", "-", "5", "8", "-", "2", "-", "-", "-"],
    ["-", "9", "-", "-", "7", "6", "4", "-", "5"],
    ["2", "-", "-", "4", "-", "-", "8", "1", "9"],
    ["-", "1", "9", "-", "-", "7", "3", "-", "6"],
    ["7", "6", "2", "-", "8", "3", "-", "9", "-"],
    ["-", "-", "-", "-", "6", "1", "-", "5", "-"],
    ["-", "-", "7", "6", "-", "-", "-", "3", "-"],
    ["4", "3", "-", "-", "2", "-", "5", "-", "1"],
    ["6", "-", "-", "3", "-", "8", "9", "-", "-"]
  ]

  it "returns a correct square from a pair of coordinates" do
    expect(square_range(4,4)).to eq(4)
  end

  it "returns a correct square from a second pair of coordinates" do
    expect(square_range(7,2)).to eq(6)
  end
end

describe "array of possible values" do
  test_array = ["-", "9", "-", "-", "7", "6", "4", "-", "5"]
  return_array = ["1","2","3","8"]
  test_array_2 = ["-", "9", "-", "1", "7", "6", "_", "-", "5"]
  return_array_2 = ["2","3","4","8"]

  it "returns an array with the missing values (from 1-9) from an array" do
    expect(possible_values(test_array)).to eq(return_array)
  end

  it "returns an array with the missing values (from 1-9) from an array" do
    expect(possible_values(test_array_2)).to eq(return_array_2)
  end

end

describe "check cell" do
  correct_board = [
    ["1", "-", "5", "8", "-", "2", "-", "-", "-"],
    ["-", "9", "-", "-", "7", "6", "4", "-", "5"],
    ["2", "7", "6", "4", "-", "-", "8", "1", "9"],
    ["-", "1", "9", "-", "-", "7", "3", "-", "6"],
    ["7", "6", "2", "-", "8", "3", "-", "9", "-"],
    ["-", "-", "-", "-", "6", "1", "-", "5", "-"],
    ["-", "-", "7", "6", "-", "-", "-", "3", "-"],
    ["4", "3", "8", "-", "2", "-", "5", "-", "1"],
    ["6", "-", "-", "3", "-", "8", "9", "-", "-"]
  ]

  it "returns a cell's correct number" do
    expect(check_cell(correct_board,1,2)).to eq("3")
  end

  it "returns false" do
    expect(check_cell(correct_board,0,8)).to eq(false)
  end

end

describe "replace value" do
    correct_board = [
    ["1", "-", "5", "8", "-", "2", "-", "-", "-"],
    ["-", "9", "-", "-", "7", "6", "4", "-", "5"],
    ["2", "7", "6", "4", "-", "-", "8", "1", "9"],
    ["-", "1", "9", "-", "-", "7", "3", "-", "6"],
    ["7", "6", "2", "-", "8", "3", "-", "9", "-"],
    ["-", "-", "-", "-", "6", "1", "-", "5", "-"],
    ["-", "-", "7", "6", "-", "-", "-", "3", "-"],
    ["4", "3", "8", "-", "2", "-", "5", "-", "1"],
    ["6", "-", "-", "3", "-", "8", "9", "-", "-"]
  ]
  it "returns the board with a replaced value for an empty space" do
    expect(replace_value(correct_board, 1, 2, check_cell(correct_board, 1, 2))).to eq([
    ["1", "-", "5", "8", "-", "2", "-", "-", "-"],
    ["-", "9", "3", "-", "7", "6", "4", "-", "5"],
    ["2", "7", "6", "4", "-", "-", "8", "1", "9"],
    ["-", "1", "9", "-", "-", "7", "3", "-", "6"],
    ["7", "6", "2", "-", "8", "3", "-", "9", "-"],
    ["-", "-", "-", "-", "6", "1", "-", "5", "-"],
    ["-", "-", "7", "6", "-", "-", "-", "3", "-"],
    ["4", "3", "8", "-", "2", "-", "5", "-", "1"],
    ["6", "-", "-", "3", "-", "8", "9", "-", "-"]
  ])
  end

  it "Returns the board originally passed in if the value at the current cell is set to false" do
    expect((replace_value(correct_board, 1, 2, check_cell(correct_board, 0, 8)))).to eq(correct_board)
  end
end
