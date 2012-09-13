require "board"
require "scoring"
require "validate"
require "human_player"
require "computer_player"
require "pry"

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

   def player_can_make_move?(player)
     move = get_player_move(player)
     return true if move != false
     return false if move == false
   end

   def move_valid?(move)
     (0..8).include?(move)
   end

   def make_move_player(player, move)
     index = player - 1
     mark = @players[index].mark
     false unless move_valid?(move)
     make_move(move,mark)
     prepare_display_state
   end

   def make_move(move,mark)
     @board.set(move, mark)
   end

   def square_taken?(cell_number)
      @board.cell_occupied?(cell_number)
   end

   def prepare_display_state
     gather_board_state.each_with_index.map do |cell, index|
       cell == " " ? (index + 1).to_s : cell
     end
   end

   def gather_board_state
     @board.current_state
   end

   def is_over?
    @scoring.winner?(@board) || @scoring.draw?(@board)
   end

   def result
     message_key = :draw
     @players.each_with_index do |player, i|
       num = i + 1
       if @scoring.winning_mark(@board) == player.mark
         message_key = "player_#{num}_win".to_sym
       end
     end
     message_key
   end
end