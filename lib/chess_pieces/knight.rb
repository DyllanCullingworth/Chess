# frozen_string_literal: true

class Knight < ChessPiece 
  
  def unicode_value
    color == :white ? '8' : 'E'
  end

end