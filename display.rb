require "byebug"
require "colorize"
require_relative "board.rb"
require_relative "cursor.rb"

class Display
  attr_reader :board

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
    @board.setup_pieces_for_new_game
  end

  def render
    0.upto(7) do |row_num|
      0.upto(7) do |col_num|
        print_piece = board[[row_num, col_num]].to_s.colorize(background: background_color)
        print print_piece
      end
      print "\n"
    end
    return nil
  end

  def background_color
    @color ||= :light_white
    @i ||= 0
    @i = 0 if @i == 8

    if @color == :light_white
      @color = :light_black unless @i == 7
      @i += 1
      return :light_white
    end

    if @color == :light_black
      @color = :light_white unless @i == 7
      @i += 1
      return :light_black
    end

    # a = @color
    # b =
    #
    # if @color == a
    #   @color = b
    #   return a
    # end

  end



end

if __FILE__ == $PROGRAM_NAME
  dis = Display.new(Board.new)

  dis.render
end
