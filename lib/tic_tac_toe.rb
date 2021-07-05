class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index,token = X)
    @board[index] = token
  end
  
  def position_taken?(index)
    ((@board[index] == "X") || (@board[index] == "O"))
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  
  def turn_count
    num_turn_count = 0
    @board.each do |space|
      if space == "X" || space == "O"
        num_turn_count += 1 
      end
    end
    return num_turn_count
  end
  
  def current_player
    if turn_count.even? 
      "X"
    else 
      "O"
    end
  end
  
  def turn
    puts "Please choose between places 1-9"
    input = gets
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else 
      turn
    end

def won?
  WIN_COMBINATIONS.detect do |win_combo|
  if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
    return win_combo
  elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
    return win_combo
  end
  false
end
end
end

def full?
  @board.all?{|occupied| occupied !=" "}
end

def draw?
  !(won?) && (full?)
end

def over?
  (draw?) || (won?) || (full?)
end

def winner
  WIN_COMBINATIONS.detect do |win_combo|
  if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
    return "X"
  elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
    return "O"
  end
  nil
end
end

def play 
  while !(over?)
    turn 
  end
  if won? 
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,6,4],
    ]
end