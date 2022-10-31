require 'chess_piece'
require 'chess_pieces/queen'

describe Queen do
  let(:grid)             { 8.times.map { Array.new(8) { 0 } } }
  let(:white_queen)      { Queen.new(:white, grid, white_position) }
  let(:black_queen)      { Queen.new(:black, grid, black_position) }
  let(:blocker)          { Queen.new(:white, grid, blocker_position) }
  let(:white_position)   { [3,0] }
  let(:black_position)   { [3,7] }
  let(:blocker_position) { [0,1] }

  before do
    white_queen.update_grid
    black_queen.update_grid
    blocker.update_grid
  end

  describe '#available_moves' do
    context 'when piece is in its starting position' do
      it { expect(white_queen.available_moves).to eq([
        [3,1], [3,2], [3,3], [3,4], [3,5], [3,6], [3,7],
        [4,1], [5,2], [6,3], [7,4],
        [4,0], [5,0], [6,0], [7,0],
        [2,0], [1,0], [0,0],
        [2,1], [1,2], [0,3]       
      ])}

      context 'when another piece is in the way' do
        context 'same color' do
          let(:blocker_position) { [3,3] }
          
          it { expect(white_queen.available_moves).to eq([
            [3,1], [3,2],
            [4,1], [5,2], [6,3], [7,4],
            [4,0], [5,0], [6,0], [7,0],
            [2,0], [1,0], [0,0],
            [2,1], [1,2], [0,3] 
          ])}
        end

        context 'different_color' do
          let(:black_position) { [3,3] }

          it { expect(white_queen.available_moves).to eq([
            [3,1], [3,2], [3,3],
            [4,1], [5,2], [6,3], [7,4],
            [4,0], [5,0], [6,0], [7,0],
            [2,0], [1,0], [0,0],
            [2,1], [1,2], [0,3] 
          ])}
        end
      end
    end

    context 'when piece is somewhere in the middle' do
      let(:white_position) { [3,3] }

      it { expect(white_queen.available_moves).to eq([
        [3,4], [3,5], [3,6], [3,7],
        [4,4], [5,5], [6,6], [7,7],
        [4,3], [5,3], [6,3], [7,3],
        [4,2], [5,1], [6,0],
        [3,2], [3,1], [3,0],
        [2,2], [1,1], [0,0],
        [2,3], [1,3], [0,3],
        [2,4], [1,5], [0,6]
      ])}

      context 'when other pieces are in the way' do
        let(:black_position)   { [6,6] }
        let(:blocker_position) { [5,1] }
  
        it { expect(white_queen.available_moves).to eq([
          [3,4], [3,5], [3,6], [3,7],
          [4,4], [5,5], [6,6],
          [4,3], [5,3], [6,3], [7,3],
          [4,2],
          [3,2], [3,1], [3,0],
          [2,2], [1,1], [0,0],
          [2,3], [1,3], [0,3],
          [2,4], [1,5], [0,6]
        ])}
      end
    end  
  end
end

