# frozen_string_literal: true

class Pawn < ChessPiece 
  
  def unicode_value
    white? ? '9' : 'F'
  end

  def valid_move(current_position, desired_position)
    return false if desired_position == current_position

    return false if desired_position[0] 
    return false if desired_position[1]
  end
  
end