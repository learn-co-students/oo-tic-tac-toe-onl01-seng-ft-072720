require 'pry'

class TicTacToe
attr_accessor :board

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]

def initialize
@board = Array.new(9, " ")
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(player_input)
  user_input = player_input.to_i
  user_input = user_input - 1
end

def position_taken?(index)
  @board[index] == "X" || @board[index] == "O"
end

def move(index, token = "X")
  @board[index] = token
end

def valid_move?(index)
  @board[index] != ("X" || "O") && index.between?(0,8)
end

def turn_count
  turns = @board.select {|slot| slot == "X" || slot == "O"}
  turns.length
end

def current_player
  if turn_count.odd?
    "O"
  elsif turn_count.even?
    "X"
    end
end

def turn
  input = gets
  player_move = input_to_index(input)
  current = current_player
  if valid_move?(player_move)
    move(player_move, current)
    display_board
  else
  input = gets
  end
end

def won?
  WIN_COMBINATIONS.each do |win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]


  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combo
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combo
    end
  end
   return false
end

def full?
  @board.all? {|spot| spot == "X" || spot == "O"}
end

def draw?
  if !won? && full?
    return true
  else
    return false
  end
end

def over?
  won? || draw?
end

def winner
  winning_array = []
  winning_array = won?
  if winning_array == false
    return nil
  else
     if @board[winning_array[0]] == "X"
        return "X"
    else
        return "O"
    end
  end
end

def play
  until over?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cat's Game!"
  end
end

end
