require_relative 'piece'
require 'byebug'

class Board
  attr_accessor :grid

  def initialize
     @grid = Array.new(8) {Array.new(8) {nil}}
     @grid[0].each_with_index do |cell, idx|
       @grid[0][idx] = Pawn.new([0, idx], :red, self)
     end
     @grid[1].each_with_index do |cell, idx|
       @grid[1][idx] = Pawn.new([1, idx], :red, self)
     end
     @grid[7].each_with_index do |cell, idx|
       @grid[7][idx] = Pawn.new([7, idx], :white, self)
     end
     @grid[6].each_with_index do |cell, idx|
       @grid[6][idx] = Pawn.new([6, idx], :white, self)
     end
   end


   def move(start, end_pos)
    #  raise "No piece at start" if @board[start].nil?
    #  raise "Not a valid move" unless @board[start].valid_move?
     self[end_pos] = Piece.new(self[end_pos], self[start].color, self)
     self[start] = nil
   end


   def [](pos)
     x, y = pos
     @grid[x][y]
   end

   def []=(pos, value)
     x, y = pos
     @grid[x][y] = value
   end

   def in_bounds?(pos)
     pos.all? { |x| x.between?(0, 7) }
   end

   def in_check?(color)
     king_pos = []
     @grid.each_with_index do |row, idx1|
       row.each_with_index do |cell, idx2|
         king_pos = [idx1, idx2] if cell.is_a?(King) && cell.color = color
       end
     end

     @grid.each do |row|
       row.each do |cell|
         if cell.is_a?(Piece) && cell.color != @grid[king_pos[0]][king_pos[1]].color
          return true if cell.moves.include?(king_pos)
         end
       end
     end
         false
   end

   def checkmate

   end

end
