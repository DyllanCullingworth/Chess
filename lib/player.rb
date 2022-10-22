# frozen_string_literal: true

class Player
  
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def initialize_pieces(:col)  
    grid[] = Pawn.new([,], :black)
  end

end