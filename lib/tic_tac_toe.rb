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
    [2,4,6]
    
    ]
    
  
def display_board
    puts " #{@board[0]} " + "|" + " #{@board[1]} " + "|" + " #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} " + "|" + " #{@board[4]} " + "|" + " #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} " + "|" + " #{@board[7]} " + "|" + " #{@board[8]} "
  
  end
  
  def input_to_index(input)
    input.to_i - 1
    
  end
  
  def move(index, value)
    @board[index] = value
    @board
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    if index.between?(0,8)
    if position_taken?(index)
      return false 
    else
      return true  
    end
  else
    return false 
  end
end


  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      value = current_player
      move(index, value)
      display_board
    else
      turn
    end
  end

   def turn_count
    counter = 0
    @board.each do |i|
      if i == "X" || i == "O"
        counter += 1
      end
    end
    counter
  end
  
  def current_player
   turn_count % 2 == 0 ? "X" : "O"
  end

def won?

    board_empty = @board.none? { |i| i == "X" || i = "O"}
    if board_empty
      false
    else 
      WIN_COMBINATIONS.each do |combo| 
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
          return combo
        end
      end
      return false
  end
end

def full?
  @board.all?{|i| i =="X" || i =="O"}
end

def draw?
  !(won?) && (full?)
  end

def over?
  won? || full? || draw? ? true : false
 end
 
 def winner
   WIN_COMBINATIONS.find do |combo| 
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" 
          return "X" 
        elsif 
            @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O" 
        return "O"
      else
        nil
        
       end
     end
   end


def play
  until over? 
  turn
end
  if  won?
    puts "Congratulations #{winner}!"
    else  draw?
    puts "Cat's Game!"
end
end
end

    















