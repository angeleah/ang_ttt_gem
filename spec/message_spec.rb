require "spec_helper"
require "message"

describe "message" do

  before (:each) do
    @message = Message.new
  end

  it "should be able to retrieve one message" do
    @message.passed(:welcome).should == "Welcome to Tic Tac Toe! You will create 2 players. The first player you create will go first.\n"
  end

  it 'should be able to retrive multiple messages' do
    @message.passed(:welcome,:create_player).should == "Welcome to Tic Tac Toe! You will create 2 players. The first player you create will go first.\n""Create a player.\n"
  end
end