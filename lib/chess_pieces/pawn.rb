# frozen_string_literal: true

class Pawn < ChessPiece 
  
  def unicode_value
    white? ? '9' : 'F'
  end

  def valid_move?(current_position, desired_position, grid)
    super

    deltaY = (desired_position[1] - current_position[1]) * direction
    deltaX = (desired_position[0] - current_position[0])

    if deltaX == 0
      return true if deltaY == 1
      return true if deltaY == 2 && first_move?(current_position)
    end

    if deltaX.abs == 1 && deltaY == 1
      return true if take_piece?(desired_position, grid)
    end

    false
  end

  def take_piece?(position, grid)
    piece = grid[position[0]][position[1]]
    
    piece.is_a?(ChessPiece) &&
    piece.color != color
  end

  def first_move?(current_position)
    current_position[1] == starting_index
  end

  def starting_index
    white? ? 1 : 6
  end
  
end

