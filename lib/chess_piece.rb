# frozen_string_literal: true

class ChessPiece 

  attr_reader :color
  
  def initialize(color)
    @color  = color
  end

   def symbol
     @_symbol ||= ('\u265' + "#{unicode_value}").gsub(/\\u[\da-f]{4}/i) { |m| [m[-4..-1].to_i(16)].pack('U') }.colorize(color)
  end

  class << self

  end

end
