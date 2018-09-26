require_relative "../errors/piece_not_initialized_error"
require 'byebug'

module SlidingPiece

  HORIZONTAL_DIRS = [
    [0, -1],
    [0, 1],
    [-1, 0],
    [1, 0]
  ]

  DIAGONAL_DIRS = [
    [-1, -1],
    [-1, 1],
    [1, -1],
    [1, 1]
  ]

attr_reader :HORIZONTAL_DIRS, :DIAGONAL_DIRS

  def moves
    moves_arr = []
    move_dirs.each do |slide_in_direction|
      n = 1

      possible_move = [
        position[0] + slide_in_direction[0],
        position[1] + slide_in_direction[1],
      ]
      until not_valid_move?(possible_move) || @board[possible_move].color != nil 
        moves_arr << possible_move
        n += 1
        possible_move = [
          position[0] + (n * slide_in_direction[0]),
          position[1] + (n * slide_in_direction[1]),
        ]
      end
    end
      # p moves_arr
      moves_arr
  end

  def move_dirs
    raise PieceNotInitilializedError.new("NO MOVES, PIECE UNINITIALIZED")
  end

end
