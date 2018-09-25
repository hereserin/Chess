require_relative "../errors/piece_not_initialized_error"

module SteppingPiece

  def moves

  end

  def move_dirs
    raise PieceNotInitilializedError.new("NO MOVES, PIECE UNINITIALIZED")
  end
end
