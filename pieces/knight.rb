require_relative "piece.rb"
require_relative "stepping_piece.rb"

class Knight < Piece

  include SteppingPiece

  def initialize(pos, color, board)
    super(pos, color, board)
  end

  def to_s
    " n "
  end

  def symbol
    " ♞ "
  end

  def move_dirs
    return [
      [-2, 1],
      [-1, 2],
      [1, 2],
      [2, 1],
      [2, -1],
      [1, -2],
      [-1, -2],
      [-2, -1]
    ]

  end


end
