require "player"
require "validate"
require "board"

class HumanPlayer < Player

  def initialize(mark)
    @mark = mark
  end

  def get_move(board)
    false
  end
end
