require_relative 'display'
require_relative 'player'
require_relative 'cursor'


class Chess


  attr_accessor :board, :player1, :player2, :display, :cursor_pos

  def initialize(board, player1, player2)
    @board = board
    @display = Display.new(board)
    @player1 = player1
    @player2 = player2
  end

  def play

    loop do
      start_result = nil
      move_result = nil
      @display.render
      start_result = display.get_input
      if start_result.nil?
        @display.render
      else
        puts "Where do you want to move it to"
        move_select_done = false
        until move_select_done
          move_result = display.get_input
          if move_result.nil?
            @display.render
          else
            @board.make_move(start_result, move_result) if @board[start_result].moves.include?(move_result)
            move_select_done = true
          end
        end
      end
    end
  end




end
