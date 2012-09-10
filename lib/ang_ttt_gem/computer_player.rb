require "player"
require "ai"
require "board"

class ComputerPlayer < Player

  attr_accessor :ai

  def initialize(mark)
    self.set_mark(mark)
  end

  def get_move(board)
    ai = Ai.new(self, board)
    cell_number = ai.find_best_move
  end
end
