# frozen_string_literal: true

class Bishop < ChessPiece 
  
  def unicode_value
    color == :white ? '7' : 'D'
  end

end