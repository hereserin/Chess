require_relative "piece.rb"
require_relative "sliding_piece.rb"

class Rook < Piece

  include SlidingPiece

  def initialize(pos, color)
    super(pos, color, :R)
  end

  def symbol
    "♜"
  end

  def move_dirs
    HORIZONTAL_DIRS.dup
  end
end
