class SteppingPiece < Piece

  def moves
     total_possible_moves = []
     possible_moves = self.move_dirs
     possible_moves.each do |move|
       delta_move = [pos[0], pos[1]]
         delta_move[0] += move[0]
         delta_move[1] += move[1]
         if @board[delta_move].nil?
           total_possible_moves << [delta_move[0], delta_move[1]] if @board.in_bounds?(delta_move)
         elsif @board[delta_move].color == self.color

         end
     end
     total_possible_moves
  end

end
