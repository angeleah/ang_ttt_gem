require "spec_helper"
require "player"

describe "Player" do

  let(:player) { Player.new }

  it "should be able to read a mark" do
    player.mark.should be_nil
  end

  it "should be able to set a mark" do
    player.mark = "T"
    player.mark.should == "T"
  end
end
