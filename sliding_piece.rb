class SlidingPiece < Piece

  def moves!
     total_possible_moves = []
     possible_dir = self.move_dirs
     possible_dir.each do |dir|
       total_possible_moves.concat(slide(dir)) unless slide(dir).nil?
     end

     total_possible_moves.select { |move| self.valid_move?(move)}
  end

  def moves
     total_possible_moves = []
     possible_dir = self.move_dirs
     possible_dir.each do |dir|
       total_possible_moves.concat(slide(dir)) unless slide(dir).nil?
     end

     total_possible_moves
  end

  def slide(dir)
    possible_moves = []
    delta_move = [pos[0], pos[1]]
    while @board.in_bounds?(delta_move)
      delta_move[0] += dir[0]
      delta_move[1] += dir[1]
      break unless @board.in_bounds?(delta_move)

      if @board[delta_move].nil?
        possible_moves << delta_move.dup
      elsif @board[delta_move].color != self.color
        possible_moves << delta_move.dup
        break
      elsif @board[delta_move].color == self.color
        break
      end
    end
      possible_moves
  end
end
