class Slots

  attr_accessor :player, :casino

  def initialize(player, casino)
    @casino = casino
    @player = player
    puts "**********************************************************\n".colorize(:light_yellow)
    puts "                          SLOTS                           \n".colorize(:light_cyan)
    puts "**********************************************************".colorize(:light_yellow)
    play
  end

  def play
    puts "\n\nYou have $#{player.bank_roll} to play with!"
    puts "\nHow much would you like to bet?"
    @bet = gets.to_i
    if @bet < @player.bank_roll
      puts "You are betting $#{@bet}\n\n"
      rolling
    else
      puts "You don't have enough money!"
      @casino.menu
    end
  end

  def rolling
    slot_01 = ["Banana", "Apple", "Pear", "Cactus", "Peach"]
    slot_02 = ["Banana", "Apple", "Pear", "Cactus", "Peach"]
    slot_03 = ["Banana", "Apple", "Pear", "Cactus", "Peach"]
    spin = []

    puts "Spinning...\n\n".colorize(:light_magenta); sleep 0.5
    option_01 = slot_01[rand(0..4)]
    option_02 = slot_02[rand(0..4)]
    option_03 = slot_03[rand(0..4)]
    spin << option_01
    spin << option_02
    spin << option_03
    print "#{spin[0]} ".colorize(:red); sleep 1
    print "#{spin[1]} ".colorize(:yellow); sleep 1
    print "#{spin[2]} \n".colorize(:green)
    spin = spin.uniq
    spin = spin.count

    if spin == 1
      win
    elsif spin == 2
      win2
    else
      lose
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
    @player.bank_roll = @player.bank_roll + (@bet * 4)
    @wallet = @player.bank_roll
    puts "\nJackpot!! You won $#{@bet * 4}!! You now have: $#{@wallet}".colorize(:green)
    play_again
  end

  def win2
    @player.bank_roll = @player.bank_roll + (@bet * 2)
    @wallet = @player.bank_roll
    puts "\nYou won $#{@bet * 2} and now have: $#{@wallet}".colorize(:light_blue)
    play_again
  end

  def lose
    @player.bank_roll = @player.bank_roll - @bet
    @wallet = @player.bank_roll
    puts "\nYou lost, you now have: $#{@wallet}".colorize(:red)
    play_again
  end

end
