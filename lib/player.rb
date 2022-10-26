# frozen_string_literal: true

class Player
  
  attr_reader \
    :color,
    :pieces

  def initialize(color)
    @color  = color
    @pieces = []
  end

  def initialize_pieces(grid)
    main_index = color == :white ? 0 : 7
    pawn_index = color == :white ? 1 : 6

    # pawns
    0.upto(7) do |i|
      pieces << Pawn.new(color, grid, [i, pawn_index])
    end

    # rooks [0, 7]
    pieces << Rook.new(color, grid, [0, main_index])
    pieces << Rook.new(color, grid, [7, main_index])

    # knights [1, 6]
    pieces << Knight.new(color, grid, [1, main_index])
    pieces << Knight.new(color, grid, [6, main_index])
    
    # bishops [2, 5]
    pieces << Bishop.new(color, grid, [2, main_index])
    pieces << Bishop.new(color, grid, [5, main_index])

    # queen [3]
    pieces << Queen.new(color, grid, [3, main_index])
    
    # king [4]
    pieces << King.new(color, grid, [4, main_index])

    pieces.each do |piece|
      piece.update_grid
    end
  end
  
end