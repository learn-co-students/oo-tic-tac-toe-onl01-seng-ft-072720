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
  if (0..8).include?(index)
    !position_taken?(index)
  end
end

def turn
  index = input_to_index(gets.chomp)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    puts "That is not a valid move, try again!"
    gets.chomp
  end
end

def turn_count
  count =  @board.find_all {|i| i != " "}
  count.length
end

def current_player
  turn_count.even? ? "X" : "O"
end

def won?
  flag = nil
  WIN_COMBINATIONS.each

def full?
  @board.none? {|i| i == " "}
end

def winner?
  WIN_COMBINATIONS.each {|win_array|
    if win_array.all? {|win_spot|
    win_spot == "X"}
      "X"
  elsif win_array.all? {|win_spot|
    win_spot == "O"}
       "O"
    else
      false
  end
 }
end

# def play
#   until full? || winner?
#
#   end
end
end
