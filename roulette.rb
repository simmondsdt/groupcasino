class Roulette

  attr_accessor :player, :casino

  def initialize(player, casino)
    @color_sel = ['Red', 'Black']
    @col = []
    @player = player
    @casino = casino
     #puts "Welcome to Roulette: #{player.name}"
    puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX".colorize(:color => :red, :background => :light_white)
    puts "XX                                                    ".colorize(:color => :red, :background => :light_white) + "XX".colorize(:color => :red, :background => :light_white)
    puts "XX                                                    ".colorize(:color => :red, :background => :light_white) + "XX".colorize(:color => :red, :background => :light_white)
    puts "XX                      ".colorize(:color => :red, :background => :light_white) + "ROULETTE".colorize(:color => :black, :background => :light_white) + "                      XX".colorize(:color => :red, :background => :light_white)
    puts "XX                                                    ".colorize(:color => :red, :background => :light_white) + "XX".colorize(:color => :red, :background => :light_white)
     puts "XX                                                    ".colorize(:color => :red, :background => :light_white) + "XX".colorize(:color => :red, :background => :light_white)
    puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX".colorize(:color => :red, :background => :light_white)
    play_num
  end

  def play_num
    puts "\nYou have $#{player.bank_roll} to play with!"
    puts "\nWhich number would you like to bet? (0-36)"
    @num = gets.strip.to_i
    if @num < 36
      puts "\nHow much would you like to bet?"
      @bet1 = gets.strip.to_i
      if (@bet1 < @player.bank_roll)
        puts "\nYou are betting $#{@bet1} on #{@num}"
        play_col_set
      else
        puts "You don't have enough money!"
        @casino.menu
      end
    else
      puts "Please put a correct number"
      play_num
    end
  end

  def play_col_set
    puts "\nWhich color would you like to bet?\n"
    puts "1: Red".colorize(:red)
    puts "2: Black".colorize(:light_black)
    @color_select = gets.strip.to_i
    case @color_select
      when 1
        @col << @color_sel[0]
        play_color
      when 2
        @col << @color_sel[1]
        play_color
      else
        puts "Please select a valid color."
    end
  end

  def play_color
    puts "How much would you like to bet?"
    @bet2 = gets.strip.to_i
    if @bet2 < @player.bank_roll
      puts "You are betting $#{@bet2} on #{@col[0]}\n"
      rolling
    else
      puts "You don't have enough money!"
      @casino.menu
    end
  end

  def rolling
    puts "\nYou are betting $#{@bet1} on #{@num} and $#{@bet2} on #{@col[0]}\n\n"
    print "Spinning . . . ".colorize(:yellow)
    print "\t\tYour bets: #{@col[0]} #{@num}"; sleep 2
    @number = rand(0..36)
    @color = @color_sel.sample
    puts "\n\nThe winning number and color is #{@color} #{@number}\n\n";sleep 1
    if @number == @num && @color == @col[0]
      ultra_win
    elsif @color == @col[0]
      win
    elsif @number == @num
      win
    else
      lose
    end
  end

    def play_again
      puts "\nWould you like to play again? (y/n)"
      again = gets.strip.downcase
      if again == 'y'
        play_num
      else
        @casino.menu
      end
    end

    def utra_win
      @bet = @bet1 && @bet2
      @player.bank_roll = @player.bank_roll + (@bet * 12)
      @wallet = @player.bank_roll
      puts "You won!! You now have: $#{@wallet}".colorize(:green)
      play_again
    end

    def win
      @bet = @bet1 && @bet2
      @player.bank_roll = @player.bank_roll + (@bet * 2)
      @wallet = @player.bank_roll
      puts "You won!! You now have: $#{@wallet}".colorize(:light_green)
      play_again
    end

    def lose
      @bet = @bet1 && @bet2
      @player.bank_roll = @player.bank_roll - @bet
      @wallet = @player.bank_roll
      puts "You lost, you now have: $#{@wallet}".colorize(:red)
      play_again
    end

end
