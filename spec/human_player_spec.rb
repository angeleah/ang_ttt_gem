require "spec_helper"
require "board"
require "game"
require "human_player"

describe "human_player" do

  let (:board)  { Board.new }
  let (:game)   { Game.new(mockui) }
  let (:player) { HumanPlayer.new("O") }

  it "get_move should return false" do
    player.get_move(board).should be_false
  end
end
