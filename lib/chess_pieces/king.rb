# frozen_string_literal: true

class King < ChessPiece 
  
  def unicode_value
    color == :white ? '4' : 'A'
  end

  def available_moves
    super
    
    deltas = [[0,1], [1,1], [1,0], [1,-1], [0,-1], [-1,-1], [-1,0], [-1,1]]
    moves  = []
    
    deltas.each do |delta|
      position = [current_position[0]+delta[0], current_position[1]+delta[1]]

      next if out_of_bounds?(position)
      next if get_piece(position)&.color == color
      next if check?(position)
      
      moves << position
    end

    moves.compact
  end

  def check?(position = current_position)
    opponent.available_moves.include?(position)
  end
  
end