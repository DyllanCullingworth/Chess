# frozen_string_literal: true

class Pawn < ChessPiece 
  
  def unicode_value
    color == :white ? '9' : 'F'
  end
  
end