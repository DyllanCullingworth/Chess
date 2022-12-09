# frozen_string_literal: true

require './lib/board'

class Chess

  include Board

  attr_accessor \
    :game_over,
    :player,
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

    @player = $white

    until game_over
      display_board

      player_input

      move_piece(@current_position, @desired_position)

      game_over?

      @player = player.opponent
    end
  end

  private

  def player_input
    input = nil

    loop do
      input = prompt("#{player.color} make a move")

      puts 'That is an invalid input' and return unless valid_input?(input)

      parse_input(input)

      break if valid_move?(@desired_position)

      puts 'That is an invalid move'
    end

    input
  end

  def valid_input?(input)
    input.match(/[1-8]{1}[a-h]{1}[1-8]{1}[a-h]{1}/)
  end

  def game_over?
    return unless player.king.check?

    if player.checkmate?
      @game_over = true
      puts 'Checkmate'
    else
      puts 'Check'
    end
  end

  def get_piece(position)
    piece = $grid[position[0]][position[1]]
    return unless piece.is_a?(ChessPiece)

    piece
  end

  def parse_input(input)
    move = input.split('').map do |value|
      if value.match(/[a-h]/)
        value.ord - 97
      else
        value.to_i - 1
      end
    end.reverse

    assign_pieces(move)
  end

  def assign_pieces(move)
    @current_position = move[2..3]
    @desired_position = move[0..1]
    @piece            = get_piece(@current_position)
    @other_piece      = get_piece(@desired_position)
  end

  def valid_move?(desired_position)
    piece.is_a?(ChessPiece) &&
      piece.color == player.color &&
      piece.valid_move?(desired_position)
  end

  def move_piece(current_position, desired_position)
    @other_piece&.current_position = nil
    piece.current_position = desired_position

    $grid[current_position[0]][current_position[1]] = ''
    $grid[desired_position[0]][desired_position[1]] = @piece
  end
end
