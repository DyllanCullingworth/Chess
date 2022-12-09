# frozen_string_literal: true

class Player
  
  attr_reader \
    :color,
    :pieces

  def initialize(color)
    @color  = color
    @pieces = []
  end

  def initialize_pieces
    pawn_index = white? ? 1 : 6

    # pawns
    0.upto(7) do |i|
      pieces << Pawn.new(color, [i, pawn_index])
    end

    # rooks [0, 7]
    pieces << Rook.new(color, [0, main_index])
    pieces << Rook.new(color, [7, main_index])

    # knights [1, 6]
    pieces << Knight.new(color, [1, main_index])
    pieces << Knight.new(color, [6, main_index])
    
    # bishops [2, 5]
    pieces << Bishop.new(color, [2, main_index])
    pieces << Bishop.new(color, [5, main_index])

    # queen [3]
    pieces << Queen.new(color, [3, main_index])
    
    # king [4]
    pieces << King.new(color, [4, main_index])

    pieces.each do |piece|
      piece.update_grid
    end
  end

  def available_moves
    moves = []
    
    pieces.each do |piece|
      moves << piece.available_moves.flatten(1).compact.uniq
    end

    moves
  end

  def castle_left?
    get_piece()
  end

  def castle_right?

  end

  def checkmate?
    return false if !king.check?
    return false if king.available_moves.any?
    return false if check_can_be_broken
    
    true
  end

  def threatning_pieces
    opponent.pieces.select do |piece|
      piece.available_moves.include? king.current_position
    end
  end

  def opponent
    white? ? $black : $white
  end

  def check_can_be_broken
  
  end

  def left_rook
    pieces[8]
  end
  
  def right_rook
    pieces[9]
  end

  def king
    pieces[-1]
  end

  def main_index
    white? ? 0 : 7  
  end

  def white?
    color == :white
  end
  
end