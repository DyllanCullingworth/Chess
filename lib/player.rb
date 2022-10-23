# frozen_string_literal: true

class Player
  
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def initialize_pieces(grid)
    main_index = color == :white ? 0 : 7
    pawn_index = color == :white ? 1 : 6

    # pawns
    0.upto(7) do |i|
      grid[i][pawn_index] = Pawn.new(color)
    end

    # rooks [0, 7]
    grid[0][main_index] = Rook.new(color)
    grid[7][main_index] = Rook.new(color)

    # knights [1, 6]
    grid[1][main_index] = Knight.new(color)
    grid[6][main_index] = Knight.new(color)
    
    # bishops [2, 5]
    grid[2][main_index] = Bishop.new(color)
    grid[5][main_index] = Bishop.new(color)

    # queen []
    grid[3][main_index] = Queen.new(color)
    
    # king []
    grid[4][main_index] = King.new(color)
  end
  
end