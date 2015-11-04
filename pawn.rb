require 'byebug'

class Pawn < Piece

  attr_reader :pos, :color, :board, :start

  def initialize(pos, color, board)
    @pos, @color, @board = pos, color, board
    @start = true
  end

  # Refactor to be readable
  def moves!
    total_possible_moves = []
    total_possible_moves.concat(diag_moves(diag_initializer))
    total_possible_moves.concat(straight_moves(move_initializer))
    total_possible_moves.select { |move| self.valid_move?(move) }
  end

  def moves
    total_possible_moves = []
    total_possible_moves.concat(diag_moves(diag_initializer))
    total_possible_moves.concat(straight_moves(move_initializer))
    total_possible_moves
  end

  def to_s
    "♟".colorize(self.color)
  end

  def diag_moves(diag_array)
    possible_diag_moves = []
    diag_array.each do |move|
      delta_move = [pos[0], pos[1]]
      delta_move[0] += move[0]
      delta_move[1] += move[1]
      if @board[delta_move].nil?
        next
      elsif @board.in_bounds?(delta_move) && @board[delta_move].color != self.color
        possible_diag_moves << [delta_move[0], delta_move[1]]
      end
    end
    possible_diag_moves
  end

  def straight_moves(straight_array)
    possible_straight_moves = []
    straight_array.each do |move|
      delta_move = [pos[0], pos[1]]
        delta_move[0] += move[0]
        delta_move[1] += move[1]
        if @board[delta_move].nil? && @board.in_bounds?(delta_move) && @board[delta_move].nil?
          possible_straight_moves << delta_move
        end
    end
    possible_straight_moves
  end


  # Method naming
  def move_initializer
    possible_moves = []
    if @color == :black
      @start = false if pos[0] != 1
      possible_moves << [1, 0]
      if @start
        possible_moves << [2, 0] if @board.grid[pos[0] + 1][pos[1]].nil?
      end
    elsif @color == :white
      possible_moves << [-1, 0]
      @start = false if @pos[0] != 6
        if @start
          possible_moves << [-2, 0] if @board.grid[pos[0] - 1][pos[1]].nil?
        end

    end
    possible_moves
  end

  # Method naming
  def diag_initializer
    diagonal_moves = []
    if @color == :black
      diagonal_moves = [[1, 1], [1, -1]]
    else
      diagonal_moves = [[-1, 1], [-1, -1]]
    end
  end
end
