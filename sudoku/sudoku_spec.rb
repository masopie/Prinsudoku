require_relative 'sudoku'

describe 'solve' do
  let (:board){"1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"}
  it 'returns the solved puzzle for an unsolved puzzle' do
    expect(solve(board)).to eq("145892673893176425276435819519247386762583194384961752957614238438729561621358947")
  end
end
