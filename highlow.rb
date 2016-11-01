class HighLow

  attr_accessor :player, :casino

  def initialize(player, casino)
    @casino = casino
    @player = player
    puts "Welcome to High Low: #{player.name}"
    puts "You have $#{player.bank_roll} to play with!\n"
    play
  end

  def play
    puts "How much would you like to bet?"
    @bet = gets.to_i
    if @bet < @player.bank_roll
      puts "You are betting $#{@bet}"
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
          puts "That's too high."
          lose
        elsif guess < @dealer_number
          puts "That's too low."
          lose
        else
          puts "Please input a valid option"
          play
        end
      elsif guess == @dealer_number
        puts "You won!!!"
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
    puts "You won!! You now have: $#{@wallet}".colorize(:green)
    play_again
  end

  def lose
    @player.bank_roll = @player.bank_roll - @bet
    @wallet = @player.bank_roll
    puts "You lost, you now have: $#{@wallet}".colorize(:red)
    play_again
  end

end
