# frozen_string_literal: true

class Pawn < ChessPiece 

  def unicode_value
    white? ? '9' : 'F'
  end
  
  def available_moves
    super
    
    [forward, take_left, take_right].flatten(1).compact
  end

  private
  
     def forward
      moves    = []
      position = current_position.dup

      2.times do
        position = position[0], position[1] + (1*direction)
        
        break if out_of_bounds?(position)
        break if get_piece(position)
        moves << position
        break if !first_move?
      end

      moves
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
      starting_index = white? ? 1 : 6
      current_position[1] == starting_index
    end
    
end

