# frozen_string_literal: true

class Queen < ChessPiece 
  
  def unicode_value
    color == :white ? '5' : 'B'
  end

  def available_moves
    [
      moves_in_direction(0,1),
      moves_in_direction(1,1),
      moves_in_direction(1,0),
      moves_in_direction(1,-1),
      moves_in_direction(0,-1),
      moves_in_direction(-1,-1),
      moves_in_direction(-1,0),
      moves_in_direction(-1,1),
    ].flatten(1).compact
  end
  
end