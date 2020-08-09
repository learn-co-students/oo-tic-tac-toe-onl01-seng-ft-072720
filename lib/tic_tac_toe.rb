require 'pry'
class TicTacToe
#setting a list of arrays that determine when you win the game 
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]
#initialize with empty board or creating 9 empty arrays 
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end 
  
#creating the board the user sees 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} " 
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} " 
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} " 
  end 

#taking the number the user sees and changing it to match the index 
  def input_to_index(input)
    input.to_i - 1
  end 


#tracking the moves
  def move(index, player = "X")
    @board[index] = player 
  end 
  
  
#checks if the users desired move is already occupied on the board 
  def position_taken?(index)
    if @board[index] != " "
      return true  
    else 
      return false   
    end
  end
  
  
#accepts a position to check. Returns true if the move is valid, false or nil if it is not.
  def valid_move?(position)
    if position_taken?(position) || !position.between?(0,8)
      false
    else 
      true 
    end
  end 


#ask for input, get input, traslate input into index, if index is valid: make the move and show the board. Else: ask for imput again
def turn
  puts 'Enter 1-9'
  index = input_to_index(gets)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end
  
  
#keeping track of the turn count    
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end


#tracking whos turn it currently is 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
#returns false/nil if no win combination is present. Returns winning combination of indexs as an array if there is a win.
def won?
  WIN_COMBINATIONS.each do | win_combo |
    if (win_combo.all? { |pos| @board[pos] == 'X' } || win_combo.all? { |pos| @board[pos] == 'O' })
     return win_combo
    end # if..
  end # WIN_COM...
  false
end # def won?

  
#returns true if every element of the board contains either an "X" or "O"
  def full?
    @board.all? {|pos| pos == "X" || pos == "O"}
    
  end 
  
#returns true if the board is full and has not been won, false if the board is won, and false if the board is neither won nor full  
  def draw?
  #true if board full and not won
    if full? && !won?
      true 
    end 
  #false if won 
  #false if not won and not full
   end 
  
#returns true if the board has been won or is full IE a draw 
  def over?
    draw? || won?
      
  end 
  
#Given a winning @board, the #winner method should return the token, "X" or "O" that has won the game 
  def winner
    won? ? @board[won?[0]] : nil 
  end 
  
  def play 
    until over? 
    turn
    end 
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end 
  end 
  
end 