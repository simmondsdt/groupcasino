class UnderOver7

  attr_accessor :player, :casino

  def initialize(player, casino)
    @player = player
    @casino = casino
    puts "Welcome to Under-Over 7 #{player.name}\n"
    # puts "Glad to see you brought your #{charm}."
    options
  end

  def options
    puts "\nYou have #{player.bank_roll} in your bank."
    puts "What would you like to do?"
    puts "1) Bet Under 7 (even)"
    puts "2) Bet Over 7 (even)"
    puts "3) Bet on 7 (odd 4:1)"
    @choice = gets.strip
    case @choice
      when '1'
        puts "You are betting on Under 7"
        bet
      when '2'
        puts "You are betting on Over 7"
        bet
      when '3'
        puts "You are betting on 7"
        bet
      else
        puts "Please put a correct number"
        options
    end
  end

  def bet
    puts "How much would you like to bet?"
    @bet = gets.strip.to_i
    if @bet < @player.bank_roll
      puts "Your bet was placed"
      play
    else
      puts "You don't have enough money!"
      @casino.menu
    end
  end

  def dice
    @die1 = 1 + rand(6)
    @die2 = 1 + rand(6)
    @sum = @die1 + @die2
    print "The sum of the dice is ", @die1 + @die2
  end

  def play
    if @choice == '1'
      dice
      if @sum < 7
        win
      else
        lose
      end
    elsif @choice == '2'
      dice
      if @sum > 7
        win
      else
        lose
      end
    else
      dice
      if @sum == 7
        seven_win
      else
        lose
      end
    end
  end

  def play_again
    puts "Would you like to play again? (y/n)"
    again = gets.strip.downcase
    if again == 'y'
      under_menu_options
    else
      @casino.menu
    end
  end

  def seven_win
    @player.bank_roll = @player.bank_roll + (@bet * 4)
    @wallet = @player.bank_roll
    puts "\n\nYou won!! You now have: $#{@wallet}".colorize(:green)
    play_again
  end

  def win
    @player.bank_roll = @player.bank_roll + (@bet * 2)
    @wallet = @player.bank_roll
    puts "\n\nYou won!! You now have: $#{@wallet}".colorize(:light_blue)
    play_again
  end

  def lose
    @player.bank_roll = @player.bank_roll - @bet
    @wallet = @player.bank_roll
    puts "\n\nYou lost, you now have: $#{@wallet}".colorize(:red)
    play_again
  end

end
