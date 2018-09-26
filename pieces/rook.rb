require_relative "piece.rb"
require_relative "sliding_piece.rb"

class Rook < Piece

  include SlidingPiece

  def initialize(pos, color, board)
    super(pos, color, board)
  end

  def to_s
    " r "
  end

  def symbol
    "♜"
  end

  def move_dirs
    HORIZONTAL_DIRS.dup
  end
end
