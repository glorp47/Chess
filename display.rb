require_relative 'board'
require_relative 'cursor'


class Display
  include Cursorable
  attr_accessor :board

  def initialize(board = Board.new)
    @board = board
    @cursor_pos = [0,0]
  end


  def render
    system("clear")
     puts "   #{(0...@board.grid.size).to_a.join("  ")}"
       @board.grid.each_with_index do |row, idx|
         row.each_with_index do |cell, idx2|
           print "#{idx} " if idx2 == 0
           if @cursor_pos == [idx, idx2]
             print "|#{cell}|".colorize(:light_blue) unless cell.nil?
             print "|_|".colorize(:light_blue) if cell.nil?
           else
             print "|#{cell}|" unless cell.nil?
             print "|_|" if cell.nil?
           end
         end
         puts ""
       end
       nil
  end


end

# row.map.with_index {|el, x| "#{el}"}.join('|')

# def play
#   until @board.won?
#     make_start_selection get_move
#     end_pos = get_move
#     make_move(start_pos, end_pos)
#     render
#   end
# end

#   def make_start_selection(pos)
#     @start_pos = pos
#   end
#
#   def move_cursor
#     until move_result
#       move_result = get_input
#     end
#     move_result
#   end
# end


# render
# start_result = get_input
# if start_result.nil?
#   render
# else
#   puts "Where do you want to move it to"
#   move_select_done = false
#   until move_select_done
#     move_result = get_input
#     if move_result.nil?
#       render
#     else
#       @board.move(start_result, move_result)
#     end
#   end
# end
