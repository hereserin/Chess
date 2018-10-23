require_relative "piece.rb"
require 'singleton'

class NullPiece < Piece
  attr_reader :color, :symbol
  def initialize
    @color = nil
    @symbol = nil
  end

  def is_null_piece?
    return true
  end

  include Singleton

  def to_s
    return " - "
  end

  def symbol
    return " - "
  end
end
