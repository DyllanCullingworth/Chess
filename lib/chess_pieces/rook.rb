# frozen_string_literal: true

class Rook < ChessPiece 
 
  def unicode_value
    color == :white ? '6' : 'C'
  end

  def available_moves
    super
    
    [
      moves_in_direction(0,1),
      moves_in_direction(1,0),
      moves_in_direction(0,-1),
      moves_in_direction(-1,0),
    ].flatten(1).compact
  end
  
end