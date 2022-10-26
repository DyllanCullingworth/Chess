require './lib/chess'
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

p1 = Player.new(:white)
p2 = Player.new(:black)

Chess.new(p1, p2).play
