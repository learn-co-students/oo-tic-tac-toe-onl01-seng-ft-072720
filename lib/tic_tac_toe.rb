class TicTacToe
attr_accessor :board
attr_reader :WIN_COMBINATIONS

WIN_COMBINATIONS = [[0,3,6],
  [1,4,7],
  [2,5,8],
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6]]


def initialize
  @board = Array.new(9," ")
end


def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(index, char = "X")
  @board[index] = char
end

def position_taken?(index)
  if @board[index] == "X" || @board[index] == "O"
    true
 else
   false
 end
end

def valid_move?(index)
  index == (0..8) ? position_taken(index) : false
end

def turn
  puts "Where would you like to go? 1-9"
  input = gets.chomp
  input_to_index
  if valid_move?
    move
  else
    puts "That is not a valid move, Try again."
  end
end

def turn_count
  count =  @board.find_all {|i| i != " "}
  count.length
end

def current_player
  turn_count.even ? "O" : "X"
end

def won?
  winning.any? {|i| i == board}
end

def full?
  @board.none? {|i| i == " "}
end

def winner?
  WIN_COMBINATIONS.each {|win_array|
    if win_array.all? {|win_spot|
    win_spot == "X"}
      puts "X WINS!"
  elsif win_array.all? {|win_spot|
    win_spot == "O"}
      puts "O WINS!"
    else
      false
  end
 }
end

def play
  until full? || winner?

  end
end
end
