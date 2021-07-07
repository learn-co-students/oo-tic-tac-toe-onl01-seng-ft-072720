
require 'pry'

class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
    ]
    
   def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(string)
 a = string.to_i 
  a = a - 1 
end

def move(index, player = "X")
  @board[index] = player
end

def position_taken?(index)
  if @board[index] == " " then return false 
  else return true 
end
end

def valid_move?(index)
 
  if (index >8 || index < 0) || @board[index] != " " then return false 
 else return true 
 end
 end
 
 def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
def turn 
 
  puts "What is your move (1-9)?"
  curr_move = gets.strip
  a = input_to_index(curr_move)
  if valid_move?(a) == true
    move(a, current_player)
    display_board
 else 
   puts "What is your move (1-9)?"
  curr_move = gets.strip
  a = input_to_index(curr_move)

 
  if valid_move?(a) == true
    move(a, current_player)
    display_board
end
end 
end

def won? 
  WIN_COMBINATIONS.map do |win_combo|
    a = @board[win_combo[0]]
    b = @board[win_combo[1]]
    c = @board[win_combo[2]]
    d = win_combo
   # binding.pry 
   
     if  position_taken?(win_combo[0]) && (a == b && b == c) then return d 
     

end
end
return nil 
end

def full?
  if @board.include?(" ") then return false
  else return true
end
end

def draw?
   # binding.pry
  if (full? == true) && (won? == nil)
  

    return true
 elsif won? == true
 return false 

end 
end

def over?
 # binding.pry
  if full? || draw?
    return true
  elsif
  won? != nil
    return true
  else
    return false
  end
  
end

def winner
  # binding.pry
  if won?
    a = won?
    return @board[a[0]]
    
  end
  return nil 
end
    
def play
  
    while over? == false do 
    turn
    # binding.pry
  end
  
    if draw? then 
      puts  "Cat's Game!"
    else
    puts "Congratulations #{winner}!"
  end
  
  end

end