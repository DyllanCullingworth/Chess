# frozen_string_literal: true

require './lib/board'

class Chess

  include Board
  
  attr_accessor \
    :game_over,
    :piece

  def initialize(p1, p2)
    @game_over = false
    $grid      = 8.times.map { Array.new(8) { '' } }
    $white     = p1
    $black     = p2
  end

  def play 
    $white.initialize_pieces
    $black.initialize_pieces

    player = $white
    
    while !game_over
      display_board
      move = prompt("#{player.color} make a move")

      if move.match(/[1-8]{1}[a-h]{1}[1-8]{1}[a-h]{1}/)
        move = map_move(move)
        
        current_position = move[2..3]
        desired_position = move[0..1]

        @piece       = get_piece(current_position)
        @other_piece = get_piece(desired_position)

        if valid_move?(player, desired_position)
          move_piece(current_position, desired_position)

          if player.king.check?
            if player.checkmate?
              game_over = true
              puts 'Checkmate'
            else
              puts 'Check'
            end
          end
          
          player == $white ? player = $black : player = $white
        else
          puts 'That is an invalid move'
        end
      else
        puts 'That is an invalid input'
      end
    end
  end

  def get_piece(position)
    piece = $grid[position[0]][position[1]]
    return if !piece.is_a?(ChessPiece)

    piece
  end

  def map_move(move)
    move.split('').map do |value|
      if value.match(/[a-h]/)
        value.ord - 97
      else
        value.to_i - 1
      end
    end.reverse
  end

  def valid_move?(player, desired_position)
    piece.is_a?(ChessPiece) && 
    piece.color == player.color &&
    piece.valid_move?(desired_position)
  end

  def move_piece(current_position, desired_position)
    @other_piece&.current_position = nil
    @piece.current_position = desired_position
    
    $grid[current_position[0]][current_position[1]] = ''
    $grid[desired_position[0]][desired_position[1]] = @piece
  end
end