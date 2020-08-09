require "pry"

class TicTacToe
  
def initialize
  @board = [" "," "," "," "," "," "," "," "," "]
end

WIN_COMBINATIONS = 
[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(board_space)
  board_to_array = board_space.to_i - 1
  board_to_array
end

def move(chosen_index, token = "X")
  @board[chosen_index] = token
end

def position_taken?(index)
  if @board[index] == " "
    false
  else 
    true
  end
end

def valid_move?(position)
  position <= 8 && position >= 0 && !position_taken?(position)
end

def turn
  loop do
    puts "Select a position between 1-9"
    input = gets.strip
    indexed_input = input_to_index(input)
    if valid_move?(indexed_input)
      move(indexed_input, current_player)
      display_board
      break
    end
  end
end

# using recursive function?

# def turn
#   puts "Select a position between 1-9"
#   input = gets.strip
#   indexed_input = input_to_index(input)
#   if valid_move?(indexed_input)
#     move(indexed_input, current_player)
#     display_board
#   else
#     turn
#   end
# end

def current_player    
  turn_count % 2 == 0 ? "X" : "O"
end
 
def turn_count
  @board.count{|token| token == "X" || token == "O"}
end


# I had to get help with this one -- needs to be reviewed!!!
def won?
  WIN_COMBINATIONS.each do |win_array|
    index_0 = win_array[0]
    index_1 = win_array[1]
    index_2 = win_array[2]
    
    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_array
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_array
    end
end
    return false
end

# def full?
#   @board.all? do |element|
#     element == "X" || "O"
#   end
# end

# def full?
#   !@board.any? do |element|
#     element == " " 
#   end
# end

def full?
    !@board.any?{|x| x == "" || x == " "}
  end

def draw?
  !won? && full?
end

def over?
  won? || draw?
end

def winner
  WIN_COMBINATIONS.each do |win_array|
    index_0 = win_array[0]
    index_1 = win_array[1]
    index_2 = win_array[2]
    
    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
    end
  end
    return nil
end

def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
  
end

end





















