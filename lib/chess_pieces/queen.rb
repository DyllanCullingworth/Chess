# frozen_string_literal: true

class Queen < ChessPiece 
  
  def unicode_value
    color == :white ? '5' : 'B'
  end
  
end