# frozen_string_literal: true

class ChessPiece 

  attr_reader :color
  
  def initialize(color)
    @color  = color
  end

  def symbol
     @_symbol ||= "265#{unicode_value}".to_i(16).chr('UTF-8').colorize(color)
  end

  def white?
    color == :white
  end

  def direction
    white? ? 1 : -1
  end

  class << self

  end

end
