require_relative "piece.rb"

class Pawn < Piece

  def initialize(pos, color, board)
    super(pos, color, board)
  end

  def to_s
    " p "
  end

  def symbol
    ""
  end

  def moves
    forward_steps + side_attacks
  end

  def at_start_row?
    return true if color == :black && position[0] == 6
    return true if color == :white && position[0] == 1
    return false
  end

  def forward_dir
    return 1 if color == :white
    return -1 if color == :black
  end

  def forward_steps
    forward_moves_arr = []

    forward_one_space = [
      position[0] + forward_dir,
      position[1]
    ]
    forward_moves_arr << forward_one_space

    if at_start_row?
      forward_two_spaces = [
        position[0] + (2 * forward_dir),
        position[1]
      ]
      forward_moves_arr << forward_two_spaces
    end

    forward_moves_arr
  end

  def side_attacks
    [
      [position[0] + forward_dir, position[1] + 1 ],
      [position[0] + forward_dir, position[1] - 1 ]
    ]
  end

end
