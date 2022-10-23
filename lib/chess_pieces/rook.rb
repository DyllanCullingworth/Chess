# frozen_string_literal: true

class Rook < ChessPiece 
 
  def unicode_value
    color == :white ? '6' : 'C'
  end
  
end