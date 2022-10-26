# frozen_string_literal: true

class Pawn < ChessPiece 
  
  def unicode_value
    white? ? '9' : 'F'
  end

  def available_moves
    [forward, take_left, take_right].flatten(1).compact
  end

  def forward
    move_1 = [current_position[0], current_position[1]+(1*direction)]
    move_2 = [current_position[0], current_position[1]+(2*direction)]

    return if out_of_bounds?(move_1)
    return if out_of_bounds?(move_2)
    return if get_piece(move_1)
    return [move_1] if get_piece(move_2) || !first_move?

    [move_1, move_2]
  end

  def take_right
    move = [current_position[0]+1 , current_position[1]+(1*direction)]
    return if out_of_bounds?(move)
    return if !opponent_piece?(move)
    
    [move]
  end

  def take_left
    move = [current_position[0]-1 , current_position[1]+(1*direction)]
    return if out_of_bounds?(move)
    return if !opponent_piece?(move)
    
    [move]
  end

  def first_move?
    current_position[1] == starting_index
  end

  def starting_index
    white? ? 1 : 6
  end
  
end

