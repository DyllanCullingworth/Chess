require 'chess_piece'
require 'chess_pieces/king'

describe King do
  let(:white_piece)      { described_class.new(:white, white_position) }
  let(:black_piece)      { described_class.new(:black, black_position) }
  let(:blocker)          { described_class.new(:white, blocker_position) }
  let(:white_position)   { [4,0] }
  let(:black_position)   { [4,7] }
  let(:blocker_position) { [0,0] }

  before do
    $grid = 8.times.map { Array.new(8) { 0 } }
    white_piece.update_grid
    black_piece.update_grid
    blocker.update_grid

    allow($white).to receive(:available_moves).and_return([[0,0]])
    allow($black).to receive(:available_moves).and_return([[0,0]])
  end

  describe '#available_moves' do
    context 'when piece is in its starting position' do
      it { expect(white_piece.available_moves).to eq([
        [4,1], [5,1], [5,0], [3,0], [3,1]      
      ])}

      context 'when the move puts the piece in check' do
        before do
         allow($black).to receive(:available_moves).and_return([[5,1]])
        end
          
        it { expect(white_piece.available_moves).to eq([
          [4,1], [5,0], [3,0], [3,1] 
        ])}
      end
    end

    context 'when piece is somewhere in the middle' do
      let(:white_position) { [3,3] }

      it { expect(white_piece.available_moves).to eq([
        [3,4], [4,4], [4,3], [4,2], [3,2], [2,2], [2,3], [2,4] 
      ])}

      context 'when the piece will move into check' do
        before do
          allow($black).to receive(:available_moves).and_return([[4,4], [4,3], [4,2], [3,2]])
        end
  
        it { expect(white_piece.available_moves).to eq([
          [3,4], [2,2], [2,3], [2,4] 
        ])}
      end
    end  
  end

  describe '#check?' do
    
  end
end

