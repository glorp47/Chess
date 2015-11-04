# coding: UTF-8

require_relative 'board'
require_relative 'cursor'



class Display
  attr_accessor :board
  include Cursorable

  def initialize(board = Board.new)
    @board = board
    @cursor_pos = [0,0]
  end

  def build_grid
    @board.rows.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    final_row = ""
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      final_row += "   ".to_s.colorize(color_options) if piece.nil?
      final_row += " #{piece} ".to_s.colorize(color_options) unless piece.nil?
    end
    final_row
  end

  def colors_for(i, j)
    if [i, j] == @cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :blue
    end
    { background: bg, color: (board.grid[i][j].nil? ? "white".to_sym : board.grid[i][j].color) }
  end

  def render
    system("clear")
    puts "Fill the grid!"
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    puts "   #{(0...@board.grid.size).to_a.join("  ")}"
    build_grid.each_with_index { |row, idx|  print "#{idx} "; puts row }
  end

  # def render
  #   system("clear")
  #    puts "   #{(0...@board.grid.size).to_a.join("  ")}"
  #      @board.grid.each_with_index do |row, idx|
  #        row.each_with_index do |cell, idx2|
  #          print "#{idx} " if idx2 == 0
  #          if @cursor_pos == [idx, idx2]
  #            print "|#{cell}|".colorize(:light_blue) unless cell.nil?
  #            print "|_|".colorize(:light_blue) if cell.nil?
  #          else
  #            print "|#{cell}|" unless cell.nil?
  #            print "|_|" if cell.nil?
  #          end
  #        end
  #        puts ""
  #      end
  #      nil
  # end


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
