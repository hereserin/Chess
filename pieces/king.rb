require_relative "piece.rb"
require_relative "stepping_piece.rb"

class King < Piece

  include SteppingPiece

  def initialize(pos, color, board)
    super(pos, color, board)
  end

  def to_s
    " K "
  end

  def symbol
    " ♚ "
  end

  def move_dirs
    return [
      [0, -1],
      [0, 1],
      [-1, 0],
      [1, 0],
      [-1, -1],
      [-1, 1],
      [1, -1],
      [1, 1]
    ]
  end

end
