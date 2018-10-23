require_relative "../board.rb"

class Piece
  attr_reader :position, :color

  def initialize(position, color, board)
    @position = position
    @color = color
    @board = board
  end

  def to_s
    return " P "
  end

  def moves
  end

  def update_position(new_pos)
    @position = new_pos
  end

  def valid_move?(new_pos)
    return false unless Board.position_on_board?(new_pos)
    return false if @board[new_pos].color == @color

    return true
  end

  def not_valid_move?(new_pos)
    !valid_move?(new_pos)
  end

  def is_null_piece?
    return false
  end


end
