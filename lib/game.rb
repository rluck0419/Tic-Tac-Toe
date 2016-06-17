class Game
  def player_move(board, name)
    loop do
      puts "#{name}: Pick a space (1-9)"
      spot = gets.chomp
      if spot.length != 0
        spot = spot.to_i
        system('clear')
        if board.space[spot-1].to_i > 0
          puts "After #{name}'s move:"
          board.add_move(spot, name)
          break
        else
          puts "Sorry?"
          board.show_board
        end
      else
        system('clear')
        puts "Sorry? Pick another space."
        board.show_board
      end
    end
  end

  def play
    system('clear')
    puts "Welcome to the game of Tic-Tac-Toe"
    puts "How many players? (1 or 2)"
    players = gets.chomp.to_i
    if players > 1
      puts "Player 1, Please enter your name:"
      name = gets.chomp
      puts "Player 2, Please enter your name:"
      name2 = gets.chomp
    else
      puts "Please enter your name:"
      name = gets.chomp
    end
    system('clear')
    board = Board.new
    board.get_player_name(name)

    #loop for each round
    board_full = false
    player_wins = false
    computer_wins = false
    loop do
      if player_wins
        puts "#{name} wins!"
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
        player_move(board, name)
        # sleep(1)
        # stop if board is full
        board_full = board.space.all? {|x| x.to_i == 0}
        # stop if player has won
        player_wins = board.check_win('X')
        computer_wins = board.check_win('O')

        if !board_full & !player_wins
          if players == 1
            system('clear')
            puts "After computer's move:"
            # computer makes a move
            board.add_computer_move
            # stop if board is full
            board_full = board.space.all? {|x| x.to_i == 0}
            # stop if computer has won
            player_wins = board.check_win('X')
            computer_wins = board.check_win('O')
          else
            # player 2 logic
            player_move(board, name2)
            # sleep(1)
            # stop if board is full
            board_full = board.space.all? {|x| x.to_i == 0}
            # stop if player has won
            player_wins = board.check_win('X')
            computer_wins = board.check_win('O')
          end
        end
      end
    end
  end
end
