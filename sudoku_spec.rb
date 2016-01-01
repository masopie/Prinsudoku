require_relative 'sudoku'

describe 'sudoku' do
    let(:board_array) {[
                      [1],[2],[3],[4],[5],[6],[7],[8],[9],
                      [1],[2,4],[3],[4],[5],[6],[7],[8],[9],
                      [1],[2],[3,5],[4],[5],[6],[7],[8],[9],
                      [1],[2],[3],[4,7],[5],[6],[7],[8],[9],
                      [1],[2],[3],[4],[5,8],[6],[7],[8],[9],
                      [1],[2],[3],[4],[5],[6,9],[7],[8],[9],
                      [1],[2],[3],[4],[5],[6],[7,9,1,3],[8],[9],
                      [1],[2],[3],[4],[5],[6],[7],[5,6],[9],
                      [1],[2],[3],[4],[5],[6],[7],[8],[9,5] ]}

  describe 'pretty_board' do
    it 'prints a prettily formatted sudoku board to the screen' do
      expect(pretty_board(board_array)).to eq("1  2  3  4  5  6  7  8  9\n1  -  3  4  5  6  7  8  9\n1  2  -  4  5  6  7  8  9\n1  2  3  -  5  6  7  8  9\n1  2  3  4  -  6  7  8  9\n1  2  3  4  5  -  7  8  9\n1  2  3  4  5  6  -  8  9\n1  2  3  4  5  6  7  -  9\n1  2  3  4  5  6  7  8  -\n")
    end
  end

  describe 'board_to_string' do
    it 'takes a board array and returns a string in original format' do
      expect(board_to_string(board_array)).to eq("1234567891-345678912-456789123-567891234-678912345-789123456-891234567-912345678-")
    end

    it 'returns a string of the proper length' do
       expect(board_to_string(board_array).length).to eq (81)
    end
  end

end
