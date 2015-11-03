require 'colorize'
require_relative 'board'
require 'byebug'

class Piece

  attr_accessor :pos, :color, :board

  def initialize(pos, color, board)
    @pos, @color, @board = pos, color, board
  end

  def to_s
    "P".colorize(self.color)
  end



end
