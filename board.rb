require_relative "pieces/all_pieces.rb"
require_relative "errors/all_exceptions.rb"

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

  def move_piece(start_pos, end_pos)
    if self[start_pos].is_a?(NullPiece)
      raise NoPieceError.new("No piece at that position")
    end

    # TODO self[start_pos].valid_moves.include?([end_pos])

    moving_piece = self[start_pos]
    self[start_pos] = NullPiece.new
    self[end_pos] = moving_piece
  end

  def setup_pieces_for_new_game
    0.upto(7) do |col|
      self[[0, col]] = Piece.new
      1.upto(6) do |row|
        self[[row, col]] = NullPiece.new
      end
      self[[7, col]] = Piece.new
    end
    return nil
  end



end
