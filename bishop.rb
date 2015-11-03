class Bishop < SlidingPiece

  def move_dirs
    [1, 1, -1, -1].permutation(2).to_a.uniq
  end

  def to_s
    "B".colorize(self.color)
  end


end
