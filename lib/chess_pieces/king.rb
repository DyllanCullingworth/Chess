# frozen_string_literal: true

class King < ChessPiece 
  
  def unicode_value
    color == :white ? '4' : 'A'
  end
  
end