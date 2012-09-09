require "board"

class Scoring

  def winner?(board)
    winning_mark(board) ? true : false
  end

  def winning_mark(board)
    board.possible_winning_combinations.each do |combo|
      if combo.uniq.size == 1 && combo[0] != " "
        return combo[0]
      end
    end
    false
  end

  def draw?(board)
    !winner?(board) && !board.spaces_available?
  end
end
