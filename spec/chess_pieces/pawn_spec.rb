require 'chess_piece'
require 'chess_pieces/pawn'

describe Pawn do
  let(:grid) { 8.times.map { Array.new(8) { 0 } } }
  let(:white_pawn) { Pawn.new(:white) }
  let(:black_pawn) { Pawn.new(:black) }

  before do
    grid[0,1] = white_pawn
    grid[0,6] = black_pawn
    
    allow_any_instance_of(ChessPiece).to receive(:grid).and_return(grid)
  end

  describe '#valid_move' do
    context 'when desired_position == current_position', :aggregate_failures do
      it{ expect(white_pawn.valid_move([0,1],[0,1])).to eq(false) }
      it{ expect(black_pawn.valid_move([0,6],[0,1])).to eq(false) }
    end
  
    context 'when move is out of bounds', :aggregate_failures do
      it{ expect(white_pawn.valid_move([0,1],[12,23])).to eq(false) }
      it{ expect(black_pawn.valid_move([0,6],[12,23])).to eq(false) }
    end

    context 'when move is one space forward', :aggregate_failures do
      it{ expect(white_pawn.valid_move([0,1],[0,2])).to eq(true) }
      it{ expect(black_pawn.valid_move([0,6],[0,5])).to eq(true) }
    end
  end
end