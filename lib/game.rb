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
          puts "After computer's move:"
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
