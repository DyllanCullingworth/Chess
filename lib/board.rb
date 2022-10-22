# frozen_string_literal: true

class Board

  attr_accessor :grid
  
  def initialize
    @pieces      = nil
    @player_turn = nil
    @grid        = 8.times.map { Array.new(8) { 0 } }

    p1 = Player.new(:white)
    p2 = Player.new(:black)
    p1.initialize_pieces
    p2.initialize_pieces
  end

  def display_board

    puts <<~HEREDOC
        |  a  |  b  |  c  |  d  |  e  |  f  |  g  |  h  |
        |#{row_spacing(7)}
      8 |#{display_row(7)}
        |#{row_spacing(7)}  
        |#{row_spacing(6)}
      7 |#{display_row(6)}
        |#{row_spacing(6)}
        |#{row_spacing(5)}
      6 |#{display_row(5)}
        |#{row_spacing(5)}
        |#{row_spacing(4)}
      5 |#{display_row(4)}
        |#{row_spacing(4)}
        |#{row_spacing(3)}
      4 |#{display_row(3)}
        |#{row_spacing(3)}
        |#{row_spacing(2)}
      3 |#{display_row(2)}
        |#{row_spacing(2)}
        |#{row_spacing(1)}
      2 |#{display_row(1)}
        |#{row_spacing(1)}
        |#{row_spacing(0)}
      1 |#{display_row(0)}
        |#{row_spacing(0)}
        |  a  |  b  |  c  |  d  |  e  |  f  |  g  |  h  |
    HEREDOC
  end

  def display_row(row)
    string = ''
    0.upto(7) do |col|
      background = (col+1 * row+1).even? ? :white : :light_black
      
      string += "#{display_piece(col, row)}".colorize(background: background) + '|'
    end
    string + " #{row+1}"
  end

  def row_spacing(row)
    string = ''
    0.upto(7) do |col|
      background = (col+1 * row+1).even? ? :white : :light_black
      string += '     '.colorize(background: background) + '|'
      color = color == :white ? :light_black : :white
    end

    string 
  end

  def change_background(current_color)
    current_color == :light_black ? :white : :light_black
  end

  def display_piece(col, row)
    piece = grid[col][row]

    return '  x  ' if piece == 0
  end

end