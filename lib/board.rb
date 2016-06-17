class Board
  attr_accessor :space
  def initialize
    @space = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
    @player = ''
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

  def get_player_name(name)
    @player = name
  end

  def add_move(spot, name)
    if name == @player
      @space[spot-1] = 'X'
      show_board
    else
      @space[spot-1] = 'O'
      show_board
    end
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

  def check_board_full
    @space.all? {|x| x.to_i == 0}
  end

  def check_winners()
    [check_win('X'), check_win('O')]
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
