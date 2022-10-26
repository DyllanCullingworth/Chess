# frozen_string_literal: true

class Pawn < ChessPiece 
  
  def unicode_value
    white? ? '9' : 'F'
  end

  def available_moves
    [up, take_left, take_right, [nil]].flatten(1).compact
  end

  def up
    move_1 = [current_position[0], current_position[1]+1]
    move_2 = [current_position[0], current_position[1]+2]

    return if get_piece(move_1)
    return [move_1] if get_piece(move_2)

    [move_1, move_2]
  end

  def take_right
    move = [current_position[0]+1 , current_position[1]+1]
    return if out_of_bounds?(move)
    return if !opponent_piece?(move)
    
    [move]
  end

  def take_left
    move = [current_position[0]-1 , current_position[1]+1]
    return if out_of_bounds?(move)
    return if !opponent_piece?(move)
    
    [move]
  end

  def get_piece(position)
    piece = grid[position[0]][position[1]]
    return if !piece.is_a?(ChessPiece)
    
    piece
  end

  def opponent_piece?(position)
    piece = get_piece(position)

    piece.is_a?(ChessPiece) &&
    piece.color != color
  end

  def first_move?
    current_position[1] == starting_index
  end

  def starting_index
    white? ? 1 : 6
  end
  
end

