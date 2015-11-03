class Pawn < Piece
  def initialize(pos, color, board)
    @pos, @color, @board = pos, color, board
    @start = true
  end

  def moves
    possible_moves = [[1, 0]]
    if @start
      possible_moves << [2, 0]
      @start = false
    end
    total_possible_moves = []
    diagonal_moves = [[1, 1], [1, -1]]
    diagonal_moves.each do |move|
      delta_move = [pos[0], pos[1]]
      delta_move[0] += move[0]
      delta_move[1] += move[1]
      total_possible_moves << [delta_move[0], delta_move[1]] if @board.in_bounds?(delta_move) && @board[delta_move].color != self.color
    end
    possible_moves.each do |move|
      delta_move = [pos[0], pos[1]]
        delta_move[0] += move[0]
        delta_move[1] += move[1]
        if @board[delta_move].nil?
          total_possible_moves << [delta_move[0], delta_move[1]] if @board.in_bounds?(delta_move) && @board.grid[delta_move[0]][delta_move[1]].nil?
        elsif @board[delta_move].color == self.color

        end
    end
    total_possible_moves
  end

  def to_s
    "p".colorize(self.color)
  end
end
