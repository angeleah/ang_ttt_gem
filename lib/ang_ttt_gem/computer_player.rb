require "player"
require "ai"
require "board"

class ComputerPlayer < Player

  attr_accessor :ai

  def initialize(mark)
    @mark = mark
  end

  def get_move(board)
    Ai.new(self, board).find_best_move
  end
end
