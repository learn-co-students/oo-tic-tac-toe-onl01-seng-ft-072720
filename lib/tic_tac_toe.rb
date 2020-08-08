require 'pry'

class TicTacToe
  
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
    ]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(str_input)
    index = str_input.to_i - 1
  end
  
  def move(index, current_player = "X")
    @board[index] = current_player
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    if index >=0 && index <= 8
  @board[index].nil? || @board[index] == " "
  end
  end
  
    def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

    def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    position = input_to_index(input)
    if valid_move?(position) == true
      player = current_player
      move(position, player)
      display_board
    else 
       turn
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
  @board.all? {|i| i == "X" || i == "O"}
  end
  
  def draw?
    if full? && !won?
      true 
    end
  end
  
  def over?
    if won? || draw?
      true
    end
  end
  
  def winner
    win = []
    win = won?
    if win == false
      nil
    else
      if @board[win[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end
  
  def play 
#     until the game is over
#   take turns
# end
    until over?
      turn
    end
 
# if the game was won
#   congratulate the winner
# else if the game was a draw
#   tell the players it ended in a draw
# end
    if won?
      puts "Congratulations #{winner}!"
    else
       puts "Cat's Game!"
    end
  end
end


