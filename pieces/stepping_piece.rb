require_relative "../errors/piece_not_initialized_error"

module SteppingPiece

  def moves
    moves_arr = []
    move_dirs.each do |step_in_direction|
      possible_move = [
        position[0] + step_in_direction[0],
        position[1] + step_in_direction[1]
      ]
      moves_arr << possible_move unless not_valid_move?(possible_move)
    end
    moves_arr
  end

  def move_dirs
    raise PieceNotInitilializedError.new("NO MOVES, PIECE UNINITIALIZED")
  end
end
