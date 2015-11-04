require 'colorize'
require_relative 'board'
require 'byebug'

class Piece

  attr_accessor :pos, :color, :board

  def initialize(pos, color, board)
    @pos, @color, @board = pos, color, board
  end

  def to_s
    "O".colorize(self.color)
  end

  def valid_move?(move)
    new_board = @board.deep_dup
    new_board.make_move(self.pos, move)
    !new_board.in_check?(self.color)
    # make move for current piece on duped board
    # return whether person is in check for duped board
  end
end
