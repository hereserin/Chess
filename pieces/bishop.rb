require_relative "piece.rb"
require_relative "sliding_piece.rb"

class Bishop < Piece

  include SlidingPiece

  def initialize(pos, color)
    super(pos, color, :B)
  end

  def symbol
    "♝"
  end

  def move_dirs
    DIAGONAL_DIRS.dup
  end
end
