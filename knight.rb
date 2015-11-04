class Knight < SteppingPiece

  def move_dirs
    [2, -2, 1, -1].permutation(2).to_a.reject {|x, y| x.abs == y.abs}
  end

  def to_s
    "♞".colorize(self.color)
  end

end
