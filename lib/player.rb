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
    create_pawns
    create_rooks
    create_knights
    create_bishops
    create_queen
    create_king
    update_grid
  end

  def update_grid
    pieces.each(&:update_grid)
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
    return false unless king.check?
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
    return false if threatning_pieces.count > 1

    # TODO: Check if other pieces can block the threatning piece
  end

  def l_rook
    pieces[8]
  end

  def r_rook
    pieces[9]
  end

  def king
    pieces[-1]
  end

  def pawn_index
    @pawn_index ||= white? ? 1 : 6
  end

  def main_index
    @main_index ||= white? ? 0 : 7
  end

  def white?
    color == :white
  end

  private

  def create_pawns
    0.upto(7) do |i|
      pieces << Pawn.new(color, [i, pawn_index])
    end
  end

  def create_rooks
    pieces << Rook.new(color, [0, main_index])
    pieces << Rook.new(color, [7, main_index])
  end

  def create_knights
    pieces << Knight.new(color, [1, main_index])
    pieces << Knight.new(color, [6, main_index])
  end

  def create_bishops
    pieces << Bishop.new(color, [2, main_index])
    pieces << Bishop.new(color, [5, main_index])
  end

  def create_queen
    pieces << Queen.new(color, [3, main_index])
  end

  def create_king
    pieces << King.new(color, [4, main_index])
  end

end
