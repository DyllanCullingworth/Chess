# frozen_string_literal: true

require './lib/board'

class Chess

  include Board
  
  attr_accessor \
    :grid, 
    :game_over,
    :player,
    :piece

  def initialize(p1, p2)
    @game_over = false
    @grid      = 8.times.map { Array.new(8) { 0 } }
    @p1        = p1
    @p2        = p2
  end

  def play 
    @p1.initialize_pieces(grid)
    @p2.initialize_pieces(grid)

    @player = @p1
    
    while !game_over
      display_board
      move = prompt("#{player.color} make a move")

      if move.match(/[1-8]{1}[a-h]{1}[1-8]{1}[a-h]{1}/)
        move = move.split('').map do |value|
          if value.match(/[a-h]/)
            value.ord - 97
          else
            value.to_i - 1
          end
        end.reverse
        
        current_position = move[2..3]
        desired_position = move[0..1]

        @piece = grid[current_position[0]][current_position[1]]

        if valid_move?(current_position, desired_position)
          move_piece(current_position, desired_position)
        else
          puts 'That is an invalid move'
        end
      else
        puts 'That is an invalid input'
      end

      sleep(3)
    end
  end

  def valid_move?(current_position, desired_position)
    piece.color == player.color &&
    piece.is_a?(ChessPiece) && 
    piece.valid_move?(current_position, desired_position, grid)
  end

  def move_piece(current_position, desired_position)
    grid[current_position[0]][current_position[1]] = ''
    grid[desired_position[0]][desired_position[1]] = piece
  end
end