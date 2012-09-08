class Board
  BLANK = " "

  def initialize
    @cells = Array.new(9) { BLANK }
  end

  def get(cell_number)
    @cells[cell_number]
  end

  def set(cell_number, mark)
    @cells[cell_number] = mark
  end

  def undo_move(cell_number)
    @cells[cell_number] = BLANK
  end

  def available_spaces
    @cells.each_with_index.select { |i, _| i == BLANK }.map { |i| i[1] }
  end

  def cell_occupied?(cell_number)
     get(cell_number.to_i - 1) != BLANK
  end

  def current_state
    @cells
  end

  def clear_all_spaces
    @cells.map! { |i| BLANK }
  end

  def rows
     [ @cells[0..2],
     @cells[3..5],
     @cells[6..8] ]
  end

  def columns
    rows.transpose
  end

  def diagonal_forward
    [ @cells[2],
    @cells[4],
    @cells[6] ]
  end

  def diagonal_back
    [ @cells[0],
    @cells[4],
    @cells[8] ]
  end

  def possible_winning_combinations
    possible_winning_combinations = []
    rows.collect{|row| possible_winning_combinations << row }
    columns.collect{|column| possible_winning_combinations << column }
    possible_winning_combinations << diagonal_forward
    possible_winning_combinations << diagonal_back
  end
end
