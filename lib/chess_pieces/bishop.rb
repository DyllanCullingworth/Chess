# frozen_string_literal: true

class Bishop < ChessPiece 
  
  def unicode_value
    color == :white ? '7' : 'D'
  end

  def available_moves
    super
    
    [
      moves_in_direction(1,1),
      moves_in_direction(1,-1),
      moves_in_direction(-1,-1),
      moves_in_direction(-1,1),
    ].flatten(1).compact
  end

end