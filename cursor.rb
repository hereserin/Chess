require "io/console"
require "byebug"
require_relative "board.rb"

KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}

MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0]
}

class Cursor

  attr_reader :cursor_pos, :board

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
    @selected = false
  end

  def toggle_selected
    @selected = !@selected
  end

  def display_color
    return :green if @selected
    return :red
  end

  def get_input
    key = KEYMAP[read_char]
    handle_key(key)
  end

  private

  def read_char
    STDIN.echo = false
    STDIN.raw!
    input = STDIN.getc.chr

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil
      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true
    STDIN.cooked!

    return input
  end

  def handle_key(key)
    case key
    when :return, :space
      toggle_selected
      return @cursor_pos
    when :up, :down, :left, :right
      update_pos(MOVES[key])
      nil
    when :ctrl_c
      Process.exit(0)
    else
      return nil
    end
  end

  def update_pos(diff)
    new_pos = @cursor_pos.dup
    new_pos[0] += diff[0]
    new_pos[1] += diff[1]
    if valid_cursor_pos(new_pos)
      @cursor_pos = new_pos
    end
    return @cursor_pos
  end

  def valid_cursor_pos(pos)
    Board.position_on_board?(pos)
  end
end
