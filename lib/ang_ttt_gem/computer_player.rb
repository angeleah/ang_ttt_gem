require "player"
require "ai"
require "board"

class ComputerPlayer
  include Player

  attr_accessor :ai

  def get_move(board)
    Ai.new(self, board).find_best_move
  end
end
