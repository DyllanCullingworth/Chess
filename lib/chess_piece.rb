# frozen_string_literal: true

class ChessPiece 

  attr_reader :color

  attr_accessor \
    :grid,
    :current_position
  
  def initialize(color, grid, position)
    @color            = color
    @grid             = grid
    @current_position = position
  end

  def valid_move?(desired_position)
    return false if desired_position == current_position
    return false if out_of_bounds?(desired_position)
    
    available_moves.include?(desired_position)
  end

  def out_of_bounds?(value)
    return true if !value[0].between?(0, 7)
    return true if !value[1].between?(0, 7)
  
    false
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

  def symbol
     @_symbol ||= "265#{unicode_value}".to_i(16).chr('UTF-8').colorize(color)
  end

  def white?
    color == :white
  end

  def direction
    white? ? 1 : -1
  end

  def update_grid
    grid[current_position[0]][current_position[1]] = self
  end

  private

    def moves_in_direction(x,y)
      moves    = []
      position = current_position.dup

      loop do 
        position = position[0]+x, position[1]+y

        break if out_of_bounds?(position)
        break if get_piece(position)&.color == color
        
        moves << position 
        
        break if opponent_piece?(position)
      end

      moves
    end

end
