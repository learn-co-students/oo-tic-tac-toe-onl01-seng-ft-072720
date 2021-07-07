require "pry"

class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #left column
    [1, 4, 7], #middle column
    [2, 5, 8], #right column
    [0, 4, 8], #top-left to bottom-right diagonal
    [2, 4, 6] #top-right to bottom-left diagonal
  ]


  def initialize
    @board = Array.new(9, " ")
  end

  def display_board

    #more abstract solution
    @board.each.with_index(1) do |value, i|
      if (i % 3) == 0 && i < 6
        puts " #{@board[i-3..i-1].join(" | ")} "
        puts "-----------"
      elsif (i % 3) == 0
        puts " #{@board[i-3..i-1].join(" | ")} "
      end
    end

        # literal solution:
        # puts " #{@board[0..2].join(" | ")} "
        # puts "-----------"
        # puts " #{@board[3..5].join(" | ")} "
        # puts "-----------"
        # puts " #{@board[6..8].join(" | ")} "
  end

  def input_to_index(string)
    string.to_i-1
  end

  def move(move_location, input)
    @board[move_location] = input.to_s.capitalize
  end

  def position_taken?(index)
    @board[index] != " " && index.between?(0,8) ? true : false
  end

  def valid_move?(index)
    @board[index] == " " && index.between?(0,8) ? true : false
  end

  def turn_count
    @board.count {|index| index != " "}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn

    puts "Please enter a number (1-9):"
    move = gets.chomp
    move = input_to_index(move)

    if valid_move?(move)
      xo = current_player
      move(move, xo)
      display_board
    else
      puts "Invalid move. Try again."
      move = gets.chomp
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return win_combo
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return win_combo
      end
    end



    #more abstract solution
    # win_data = []
    # WIN_COMBINATIONS.each do |win_combo|
    #   win_check = []
    #         win_combo.each do |value|
    #         win_check << @board[value]

    #         end
    #       if win_check.uniq.size == 3
    #         win_data = win_combo
    #       end
    #   end
    #     if win_data == []
    #       false
    #     else
    #       win_data
    #     end
      # binding.pry
  end

  def full?
    !@board.include? " "
  end

  def draw?
    if !won? && full?
      true
    else
      false
    end
  end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def winner
    if over?
    WIN_COMBINATIONS.each do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return "X"
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return "O"
      end
    end
  end
  end

  def play
    while !over?
      turn
    end

    if over?
      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cat's Game!"
      end
    end

  end


# binding.pry
end
