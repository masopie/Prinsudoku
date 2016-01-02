require_relative 'sudoku'

  describe 'cell selection' do
    it 'returns correct values for cells in same row' do
      expect(can_see_row(0)).to eq [1,2,3,4,5,6,7,8]
      expect(can_see_row(31)).to eq [27,28,29,30,32,33,34,35]
    end

    it 'returns correct values for cells in same column' do
      expect(can_see_column(0)).to eq [9,18,27,36,45,54,63,72]
      expect(can_see_column(59)).to eq [5,14,23,32,41,50,68,77]
    end

    it 'returns correct values for cells in same block' do
      expect(can_see_block(0)).to eq [1,2,9,10,11,18,19,20]
      expect(can_see_block(34)).to eq [33,35,42,43,44,51,52,53]
    end
  end

context "initialization" do
  let(:input) {"1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"}
  let(:output) {"145892673893176425276435819519247386762583194384961752957614238438729561621358947"}
  it 'creates an array of the correct length' do
    expect(initialize_cell_info(input).length).to eq 81
  end

  it "returns a string for board_to_string" do
    board = solve(input)
    expect(board_to_string(solve(input))).to be_a String
  end

  it "expects the solved string for input to be" do
    expect(board_to_string(solve(input))).to eq output
  end

  it "expects the solved string to have 9 of each number" do
    expect(board_to_string(solve(input)).count("1")).to be 9
    expect(board_to_string(solve(input)).count("2")).to be 9
    expect(board_to_string(solve(input)).count("3")).to be 9
    expect(board_to_string(solve(input)).count("4")).to be 9
    expect(board_to_string(solve(input)).count("5")).to be 9
    expect(board_to_string(solve(input)).count("6")).to be 9
    expect(board_to_string(solve(input)).count("7")).to be 9
    expect(board_to_string(solve(input)).count("8")).to be 9
    expect(board_to_string(solve(input)).count("9")).to be 9
  end

end

context 'remove referenced cells correctly' do
  let(:array) {[ {:possible_values=>[1,2,3], :can_see=>[1]}, {:possible_values=>[1], :can_see=>[0]}
    ]}
    it "removes referenced value correctly" do
      expect(remove_possible_values(array[0], array)[:possible_values]).to eq [2,3]
    end
end
