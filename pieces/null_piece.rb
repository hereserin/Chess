require_relative "piece.rb"

class NullPiece < Piece
  def to_s
    return " - "
  end
end
