# create board
# place O or X on the board
# check results
# repeat until - 3 O's or X's in a row, or run out of spaces

class Board
  attr_accessor :space
  def initialize
    @space = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
    show_board
  end

  def show_board
    puts "#{@space[0]}   |#{@space[1]}   |#{@space[2]}"
    puts "    |    |"
    puts "____|____|____"
    puts "#{@space[3]}   |#{@space[4]}   |#{@space[5]}"
    puts "    |    |"
    puts "____|____|____"
    puts "#{@space[6]}   |#{@space[7]}   |#{@space[8]}"
    puts "    |    |"
    puts "    |    |"
  end

  def add_move(spot)
    @space[spot-1] = 'X'
    show_board
  end

  def add_computer_move
    loop do
      spot = @space.sample
      if spot.to_i > 0
        @space[@space.index(spot)] = 'O'
        show_board
        break
      else
      end
    end
  end

  def check_win(character)
    if @space[0] == character
      if @space[1] == character && @space[2] == character
        player_wins = true
      elsif @space[3] == character && @space[6] == character
        player_wins = true
      elsif @space[4] == character && @space[8] == character
        player_wins = true
      else
      end
    elsif @space[1] == character && @space[4] == character && @space[7] == character
      player_wins = true
    elsif @space[2] == character
      if @space[4] == character && @space[6] == character
        player_wins = true
      elsif @space[5] == character && @space[8] == character
        player_wins = true
      end
    elsif @space[3] == character && @space[4] == character && @space[5] == character
      player_wins = true
    elsif @space[6] == character && @space[7] == character && @space[8] == character
      player_wins = true
    else
    end
  end
end

class Game
  def player_move(board)
    loop do
      puts "Pick a space (1-9)"
      spot = gets.chomp
      if spot.length != 0
        spot = spot.to_i
        system('clear')
        if board.space[spot-1].to_i > 0
          puts "After your move:"
          board.add_move(spot)
          break
        else
          puts "Sorry?"
          board.show_board
        end
      else
        system('clear')
        puts "Sorry?"
        board.show_board
      end
    end
  end

  def play
    system('clear')
    puts "Welcome to the game of Tic-Tac-Toe"
    board = Board.new

    #loop for each round
    board_full = false
    player_wins = false
    computer_wins = false
    loop do
      if player_wins
        puts "Player Wins!"
        break
      elsif computer_wins
        puts "Computer wins! Sorry!"
        break
      elsif board_full
        puts "It's a tie. Like always."
        break
      else
        # when board isn't full, loop until player provides space (1-9)
        # long term - replace with - while until unless etc.
        player_move(board)
        sleep(1)
        # stop if board is full
        board_full = board.space.all? {|x| x.to_i == 0}
        # stop if player has won
        player_wins = board.check_win('X')
        computer_wins = board.check_win('O')

        if !board_full & !player_wins
          system('clear')
          puts "Computer's move"
          # computer makes a move
          board.add_computer_move
          # stop if board is full
          board_full = board.space.all? {|x| x.to_i == 0}
          # stop if computer has won
          player_wins = board.check_win('X')
          computer_wins = board.check_win('O')
        end
      end
    end
  end
end

Game.new.play
