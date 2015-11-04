class Rook < SlidingPiece

  def move_dirs
    [1, 1, 0, -1, -1].permutation(2).to_a.select { |x, y| x.abs != y.abs }.uniq
  end

  def to_s
    "♜".colorize(self.color)
  end

end
