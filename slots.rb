class Slots

  attr_accessor :player, :casino

  def initialize(player, casino)
    @casino = casino
    @player = player
    puts "Welcome to the Slot Machine: #{player.name}"
    puts "You have $#{player.bank_roll} to play with!\n"
    play
  end

  def play
    puts "How much would you like to bet?"
    @bet = gets.to_i
    if @bet < @player.bank_roll
      puts "You are betting $#{@bet}"
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

    puts "Spinning\n"; sleep 0.5
    option_01 = slot_01[rand(0..5)]
    spin << option_01
    option_02 = slot_02[rand(0..5)]
    spin << option_02
    option_03 = slot_03[rand(0..5)]
    spin << option_03
    print "#{spin[0]} "; sleep 1
    print "#{spin[1]} "; sleep 1
    print "#{spin[2]} "
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
    puts "\nJackpot!! You won $#{@bet * 4}!! You now have: #{@wallet}"
    play_again
  end

  def win2
    @player.bank_roll = @player.bank_roll + (@bet * 1.5)
    @wallet = @player.bank_roll
    puts "\nOkay. You won $#{@bet * 1.5} and now have: #{@wallet}"
    play_again
  end

  def lose
    @player.bank_roll = @player.bank_roll - @bet
    @wallet = @player.bank_roll
    puts "\nYou lost, you now have: #{@wallet}"
    play_again
  end

end
