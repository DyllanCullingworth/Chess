# frozen_string_literal: true

class Knight < ChessPiece 
  
  def unicode_value
    color == :white ? '8' : 'E'
  end

  def available_moves
    deltas = [[1,2], [2,1], [2,-1], [1,-2], [-1,-2], [-2,-1], [-2,1], [-1,2]]
    moves  = []
    
    deltas.each do |delta|
      position = [current_position[0]+delta[0], current_position[1]+delta[1]]

      next if out_of_bounds?(position)
      next if get_piece(position)&.color == color
      
      moves << position
    end

    moves.compact
  end
  
end