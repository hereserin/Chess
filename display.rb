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



#         str = piece.to_s
#
#         background = :light_white
#
#         if (idx1.even? && idx2.even?) || (idx1.odd? && idx2.odd?)
#           background = :light_white
#         else
#           background = :light_black
#         end
#
#         str = str.colorize(piece.color)
#
#         str = " #{str} ".colorize( :background => background)
#
#         if [idx1, idx2] == cursor.cursor_pos
#           str = str.on_red #.blink
#         end
#
#         print str
#       end
#
#       print "\n"
#   end
#
# nil
#   end

  def background_color
    @color ||= :light_white

    if @color == :light_white
      @color = :light_black
      return :light_white
    end

    if @color == :light_black
      @color = :light_white
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
