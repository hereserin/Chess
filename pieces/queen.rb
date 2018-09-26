require_relative "piece.rb"
require_relative "sliding_piece.rb"

class Queen < Piece

  include SlidingPiece

  def initialize(pos, color, board)
    super(pos, color, board)
  end

  def to_s
    " Q "
  end

  def symbol
    " ♛ "
  end

  def move_dirs
    DIAGONAL_DIRS.dup + HORIZONTAL_DIRS.dup
  end
end
