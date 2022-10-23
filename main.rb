require './lib/board'
require './lib/chess_piece'
require './lib/chess_pieces/bishop'
require './lib/chess_pieces/king'
require './lib/chess_pieces/knight'
require './lib/chess_pieces/pawn'
require './lib/chess_pieces/queen'
require './lib/chess_pieces/rook'
require './lib/player'
require './lib/misc'
require 'colorize'

Board.new.display_board
