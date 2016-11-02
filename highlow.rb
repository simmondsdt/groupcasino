class HighLow

  attr_accessor :player, :casino

  def initialize(player, casino)
    @casino = casino
    @player = player
    puts "\n ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:light_blue)
    puts "\n                  Welcome to High Low\n".colorize(:light_yellow)
    puts " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:light_blue)
    puts "\n\nYou have $#{player.bank_roll} to play with!"
    play
  end

  def play
    puts "\nHow much would you like to bet?"
    @bet = gets.to_i
    if @bet < @player.bank_roll
      puts "You are betting $#{@bet} for a ONE-time play!\n".colorize(:color => :light_yellow, :mode => :italic)
      puts 'Pick a number between 1 and 10'
      @dealer_number = rand(1..10)
      continue
    else
      puts "You don't have enough money!"
      @casino.menu
    end
  end

  def continue
    guess = gets.strip.to_i
      if guess != @dealer_number
        if guess > @dealer_number
          puts "\nThat's too high."
          lose
        elsif guess < @dealer_number
          puts "\nThat's too low."
          lose
        else
          puts "Please input a valid option"
          play
        end
      elsif guess == @dealer_number
        puts "\nYou won!!!".colorize(:green)
        win
      else
        puts "Please input a valid number"
        play
      end
  end

  def play_again
    puts "Would you like to play again? (y/n)"
    again = gets.strip.downcase
    if again == 'y'
      play
    else
      @casino.menu
    end
  end

  def win
    @player.bank_roll = @player.bank_roll + (@bet * 2)
    @wallet = @player.bank_roll
    puts "You now have: $#{@wallet}".colorize(:green)
    play_again
  end

  def lose
    @player.bank_roll = @player.bank_roll - @bet
    @wallet = @player.bank_roll
    puts "\nYou lost, you now have: $#{@wallet}".colorize(:red)
    play_again
  end

end
