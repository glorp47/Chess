class Queen < SlidingPiece

  def move_dirs
    [1, 1, 0, -1, -1].permutation(2).to_a.uniq
  end

  def to_s
    "Q".colorize(self.color)
  end

end
