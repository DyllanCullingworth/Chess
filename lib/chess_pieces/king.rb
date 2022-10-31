# frozen_string_literal: true

class King < ChessPiece 
  
  def unicode_value
    color == :white ? '4' : 'A'
  end

  def available_moves
    [[0,1], [1,1], [1,0], [1,-1], [0,-1], [-1,-1], [-1,0], [-1,1]]
  end
  
end