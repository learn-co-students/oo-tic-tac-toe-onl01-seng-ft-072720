require "pry"
class TicTacToe 
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
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
  
  def input_to_index(user_input)
    num = user_input.to_i
    num = num - 1 
    @board[num] = num 
  end
  
  def move(index, token = "X")
    @board[index] = token 
  end
  
  def position_taken?(index)
    if @board[index] == "X" 
     true 
    elsif @board[index] == "O"
      true
    else
     false
  end
end
  
  def valid_move?(move)
  
    if position_taken?(move) == true || move > 8 || move < 0 
      false
    else
      true
    end
  end
  
  def turn_count
    turn = 0 
    @board.each do |index| 
    if index == "X" 
      turn += 1
    elsif index == "O"
      turn += 1
    end
  end
  turn 
end
  
  def current_player 
    if turn_count.odd?
      "O"
    elsif turn_count.even?
      "X"
  end
end
 
  def turn
    token = current_player
    puts "what is your move 1-9"
    user_move = gets.chomp 
    user_move = input_to_index(user_move)
   
    if user_move <= 8 && valid_move?(user_move) == true 
      move(user_move, token)
      display_board
    elsif user_move > 8 || valid_move?(user_move) == false
      puts "invalid move please try again"
      user_move = gets.chomp 
    
    end
  end
  
  def won?
   WIN_COMBINATIONS.each do |array|
    if @board[array[0]] == "X" && @board[array[1]] == "X" && @board[array[2]] == "X"
       return array 
    elsif @board[array[0]] == "O" && @board[array[1]] == "O" && @board[array[2]] == "O"
       return array 
    else 
       array = nil
    end
  end
  return false
end
  
  def full?
    unless @board.include?(" ")
      return true
    end
  return false 
end

  def draw?
    if full? == true && won? == false
      return true 
    else 
      return false 
    end
  end
  
  def over?
    if draw? == true || won? != false
      return true 
    else
      return false
    end
  end
  
  def winner
    if won? != false && turn_count.odd? == false 
      return "O"
    elsif won? != false && turn_count.even? == false
      return "X"
    else 
      return nil 
    end
  end
  
  def play 
  until over? == true 
    turn
    if won? == false
      false 
    else 
      true
    end
  end
  
  if won? != false  
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
    end
  end
end