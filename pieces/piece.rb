require_relative "../board.rb"

class Piece
  attr_reader :position

  def initialize(position, color, symbol)
    @position = position
    @color = color
    @symbol = symbol
  end

  def to_s
    return " P "
  end

  def moves
  end

  def valid_move?(new_pos)
    return false unless Board.position_on_board?(new_pos)
    return true
  end

  def not_valid_move?(new_pos)
    !valid_move?(new_pos)
  end

end
