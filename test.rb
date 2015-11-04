load './display.rb'
load './game.rb'


b = Board.new
d = Display.new(b)
p1 = Player.new("P1")
p2 = Player.new("P2")
game = Chess.new(b, p1, p2)
game.play
