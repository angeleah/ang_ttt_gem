require "board"
require "scoring"
require "validate"
require "human_player"
require "computer_player"

class Game

  attr_reader :players, :board

  def initialize
    @board = Board.new
    @scoring = Scoring.new
    @validate = Validate.new
    @players = []
  end

  def create_computer_player(mark)
    @players << ComputerPlayer.new(mark)
  end

   def create_human_player(mark)
     @players << HumanPlayer.new(mark)
   end

   def get_player_move(player)
     index = player - 1
     @players[index].get_move(@board)
   end

   def move_valid?(move)
     (0..8).include?(move)
   end

   def make_move_player(player, move)
     return false unless move_valid?(move)
     index = player - 1
     mark = @players[index].mark
     @board.set(move, mark)
     prepare_display_state
   end

   def square_taken?(cell_number)
      @board.cell_occupied?(cell_number)
   end

   def prepare_display_state
     @board.current_state.each_with_index.map do |cell, index|
       cell == " " ? (index + 1).to_s : cell
     end
   end

   def over?
     @scoring.winner?(@board) || @scoring.draw?(@board)
   end

   def result
     winning_mark = @scoring.winning_mark(@board)
     return :player_1_win if winning_mark == @players[0].mark
     return :player_2_win if winning_mark == @players[1].mark
     :draw
   end
end
