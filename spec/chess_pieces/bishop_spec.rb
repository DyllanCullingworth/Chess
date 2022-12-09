require 'chess_piece'
require 'chess_pieces/bishop'

describe Bishop do
  let(:white_piece)      { described_class.new(:white, white_position) }
  let(:black_piece)      { described_class.new(:black, black_position) }
  let(:blocker)          { described_class.new(:white, blocker_position) }
  let(:white_position)   { [2,0] }
  let(:black_position)   { [2,7] }
  let(:blocker_position) { [3,0] }

  before do
    $grid = 8.times.map { Array.new(8) { 0 } }
    white_piece.update_grid
    black_piece.update_grid
    blocker.update_grid
  end

  describe '#available_moves' do
    context 'when piece is in its starting position' do
      it { expect(white_piece.available_moves).to eq([
        [3,1], [4,2], [5,3], [6,4], [7,5],
        [1,1], [0,2] 
      ])}

      context 'when another piece is in the way' do
        context 'same color' do
          let(:blocker_position) { [1,1] }
          
          it { expect(white_piece.available_moves).to eq([
            [3,1], [4,2], [5,3], [6,4], [7,5]
          ])}
        end

        context 'different_color' do
          let(:black_position) { [1,1] }

          it { expect(white_piece.available_moves).to eq([
            [3,1], [4,2], [5,3], [6,4], [7,5],
            [1,1]
          ])}
        end
      end
    end

    context 'when piece is somewhere in the middle' do
      let(:white_position) { [3,3] }

      it { expect(white_piece.available_moves).to eq([
        [4,4], [5,5], [6,6], [7,7],
        [4,2], [5,1], [6,0],
        [2,2], [1,1], [0,0],
        [2,4], [1,5], [0,6]
      ])}

      context 'when other pieces are in the way' do
        let(:black_position)   { [6,6] }
        let(:blocker_position) { [2,4] }
  
        it { expect(white_piece.available_moves).to eq([
          [4,4], [5,5], [6,6],
          [4,2], [5,1], [6,0],
          [2,2], [1,1], [0,0]
        ])}
      end
    end  
  end
end

