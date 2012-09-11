require "spec_helper"
require "player"

describe "Player" do

  class Dummy
    include Player
  end

  let(:player) { Dummy.new("Q") }

  it "should be able to read a mark" do
    player.mark.should == "Q"
  end

  it "should be able to set a mark" do
    player.mark = "T"
    player.mark.should == "T"
  end
end
