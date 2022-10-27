require 'chess_piece'
require 'chess_pieces/pawn'

describe Pawn do
  let(:grid)           { 8.times.map { Array.new(8) { 0 } } }
  let(:white_pawn)     { Pawn.new(:white, grid, white_position) }
  let(:black_pawn)     { Pawn.new(:black, grid, black_position) }
  let(:white_position) { [0,1] }
  let(:black_position) { [0,6] }

  before do
    white_pawn.update_grid
    black_pawn.update_grid
  end

  # describe '#valid_move' do
  #   context 'when desired_position == current_position', :aggregate_failures do
  #     it{ expect(white_pawn.valid_move?([0,1])).to eq(false) }
  #     it{ expect(black_pawn.valid_move?([0,1])).to eq(false) }
  #   end
  
  #   context 'when move is out of bounds', :aggregate_failures do
  #     it{ expect(white_pawn.valid_move?([12,23])).to eq(false) }
  #     it{ expect(black_pawn.valid_move?([12,23])).to eq(false) }
  #   end
  # end

  describe '#available_moves' do
    context 'as a white pawn' do
      context 'when piece is in starting position' do
        it { expect(white_pawn.available_moves).to eq([[0,2], [0,3]])}   
      
        context 'when another piece is two steps in front' do
          let(:black_position) { [0,3] }
    
          it { expect(white_pawn.available_moves).to eq([[0,2]])} 
        end
  
        context 'when another piece is one step in front' do
          let(:black_position) { [0,2] }
    
          it { expect(white_pawn.available_moves).to eq([])} 
        end
  
        context 'when an opponent piece is on the diagonal' do
          let(:black_position) { [1,2] }
    
          it { expect(white_pawn.available_moves).to eq([[0,2], [0,3], [1,2]])} 
        end
      end

      context 'when piece has already moved' do
        let(:white_position) { [0,2] }
        
        it { expect(white_pawn.available_moves).to eq([[0,3]])}

        context 'when an opponent piece is on the diagonal' do
          let(:black_position) { [1,3] }
    
          it { expect(white_pawn.available_moves).to eq([[0,3], [1,3]])} 
        end
      end

      context 'when piece is at the edge' do
        let(:white_position) { [0,7] }
        
        it { expect(white_pawn.available_moves).to eq([])}
      end

      context 'when piece is one piece from the edge' do
        let(:white_position) { [0,6] }
        
        it { expect(white_pawn.available_moves).to eq([[0,7]])}
      end
    end

    context 'as a black pawn' do
      context 'when piece is in starting position' do
        it { expect(black_pawn.available_moves).to eq([[0,5], [0,4]])}  

        context 'when another piece is two steps in front' do
          let(:white_position) { [0,4] }
    
          it { expect(black_pawn.available_moves).to eq([[0,5]])} 
        end
    
        context 'when another piece is one step in front' do
          let(:white_position) { [0,5] }
    
          it { expect(black_pawn.available_moves).to eq([])} 
        end

        context 'when an opponent piece is on the diagonal' do
          let(:white_position) { [1,5] }
    
          it { expect(black_pawn.available_moves).to eq([[0,5], [0,4], [1,5]])} 
        end
      end 

      context 'when piece has already moved' do
        let(:black_position) { [0,4] }
        
        it { expect(black_pawn.available_moves).to eq([[0,3]])}

        context 'when an opponent piece is on the diagonal' do
          let(:white_position) { [1,3] }
    
          it { expect(black_pawn.available_moves).to eq([[0,3], [1,3]])} 
        end
      end

      context 'when piece is at the edge' do
        let(:black_position) { [0,0] }
        
        it { expect(black_pawn.available_moves).to eq([])}
      end

      context 'when piece is one piece from the edge' do
        let(:black_position) { [0,1] }
        
        it { expect(black_pawn.available_moves).to eq([[0,0]])}
      end
    end
  end
end

