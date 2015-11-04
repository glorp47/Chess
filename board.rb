require_relative 'piece'
require 'byebug'
require_relative 'sliding_piece'
require_relative 'stepping_piece'
require_relative 'pawn'
require_relative 'king'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'queen'

class Board
  attr_accessor :grid

  def rows
    grid
  end

  def initialize(populate_board = true)
     @grid = Array.new(8) {Array.new(8) {nil}}
     if populate_board
       populate
     end
   end

   def populate
     @grid[0].each_with_index do |cell, idx|
       if idx == 0 || idx == 7
         @grid[0][idx] = Rook.new([0, idx], :black, self)
       elsif idx == 1 || idx == 6
         @grid[0][idx] = Knight.new([0, idx], :black, self)
       elsif idx == 2 || idx == 5
         @grid[0][idx] = Bishop.new([0, idx], :black, self)
       elsif idx == 3
         @grid[0][idx] = Queen.new([0, idx], :black, self)
       else
         @grid[0][idx] = King.new([0, idx], :black, self)
       end
     end
     @grid[1].each_with_index do |cell, idx|
       @grid[1][idx] = Pawn.new([1, idx], :black, self)
     end
     @grid[6].each_with_index do |cell, idx|
       @grid[6][idx] = Pawn.new([6, idx], :white, self)
     end
     @grid[7].each_with_index do |cell, idx|
       if idx == 0 || idx == 7
         @grid[7][idx] = Rook.new([7, idx], :white, self)
       elsif idx == 1 || idx == 6
         @grid[7][idx] = Knight.new([7, idx], :white, self)
       elsif idx == 2 || idx == 5
         @grid[7][idx] = Bishop.new([7, idx], :white, self)
       elsif idx == 3
         @grid[7][idx] = Queen.new([7, idx], :white, self)
       else
         @grid[7][idx] = King.new([7, idx], :white, self)
       end
     end
   end


   def make_move(start, end_pos)
    #  raise "No piece at start" if @board[start].nil?
    #  raise "Not a valid move" unless @board[start].valid_move?
     self[end_pos] = self[start].class.new(end_pos, self[start].color, self)
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
     king_pos = find_king_position(color)
     @grid.each do |row|
       row.each do |cell|
         if cell.is_a?(Piece) && cell.color != color
          return true if cell.moves.include?(king_pos)
         end
       end
     end
         false
   end

   def find_king_position(color)
     king_pos = []
     @grid.each_with_index do |row, idx1|
       row.each_with_index do |cell, idx2|
         if cell.is_a?(King) && cell.color == color
           return [idx1, idx2]
         end
       end
     end
     nil
   end



  #  def checkmate?(color)
  #    king_pos = find_king_position(color)
   #
  #    @grid.each do |row|
  #      row.each do |cell|
  #        if cell.is_a?(Piece) && cell.color != color
  #         # return false if
  #        end
  #      end
  #    end
  #        false
  #  end

   def deep_dup
     new_board = Board.new(false)
     self.grid.each.with_index do |row, idx1|
       row.each.with_index do |cell, idx2|
         if self.grid[idx1][idx2].nil?
           next
         else
           new_board.grid[idx1][idx2] = self.grid[idx1][idx2].dup
           new_board.grid[idx1][idx2].board = new_board
         end
       end
     end
     new_board
   end


end
