require_relative "pieces/all_pieces.rb"
require_relative "errors/all_exceptions.rb"
require "byebug"

class Board

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def [](pos_arr)
    @grid[pos_arr[0]][pos_arr[1]]
  end

  def []=(pos_arr, value)
    @grid[pos_arr[0]][pos_arr[1]] = value
  end

  def self.position_on_board?(pos)
    if pos[0] >= 0 && pos[0] < 8
      if pos[1] >= 0 && pos[1] < 8
        return true
      end
    end

    return false
  end

  def move_piece(start_pos, end_pos)
    raise NoPieceError.new("No piece at that position") if self[start_pos].is_a?(NullPiece)
    # debugger
    raise InvalidTargetError.new("Not a valid move") unless self[start_pos].moves.include?(end_pos)
    # TODO self[start_pos].valid_moves.include?([end_pos])

    moving_piece = self[start_pos]
    self[start_pos] = NullPiece.instance
    self[end_pos] = moving_piece
    moving_piece.update_position(end_pos)
  end

  def setup_pieces_for_new_game
    place_pawns
    place_back_row_pieces
    place_nulls
  end

  private
  def place_pawns
    0.upto(7) do |col|
      self[[1, col]] = Pawn.new([1,col], :blue, self)
      self[[6, col]] = Pawn.new([6,col], :black, self)
    end
  end

  def place_back_row_pieces
    [ Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook ].each_with_index do |piece, idx|
      self[[0, idx]] = piece.new([0, idx], :blue, self)
      self[[7, idx]] = piece.new([7, idx], :black, self)
    end
  end

  def place_nulls
    0.upto(7) do |col|
      2.upto(5) do |row|
        self[[row, col]] = NullPiece.instance
      end
    end
  end


end
