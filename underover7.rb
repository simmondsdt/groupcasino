#Under-Over 7
#An even money bet that the total will be under 7
#an even money bet that the total will be over 7
#An odds bet that the total will be 7. Typical 4 to 1
class UnderOver7

  attr_accessor :player, :casino

  def initialize(player, casino)
    @player = player
    @casino = casino
    puts "Welcome to Under-Over 7 #{player.name}"
    puts "You have #{player.bank_roll} in your bank."
    # puts "Glad to see you brought your #{charm}."
    under_menu_options
  end

  def under_menu_options
    puts "\nLets Play Under-Over 7\n\n"
    puts "You will be rolling 2 die.\n"
    puts "Select betting option:"
    puts "1) Under 7 (even)"
    puts "2) Over 7 (even)"
    puts "3) Betting on 7 (odd 4:1)"
    # puts "4) Exit\n"
    play
  end

  def play
    puts "What would you like to do?"
    bet_choice = gets.strip
      case bet_choice
        when "1"
          puts "Place your bet."
              @bet = gets.to_i
              if @bet < @player.bank_roll
                puts "You are betting $#{@bet} on Under 7"
                play_under
              else
                puts "You don't have enough"
                @casino.menu
              end
        when "2"
          puts "Place your bet."
              @bet = gets.to_i
              if @bet < @player.bank_roll
                puts "You are betting $#{@bet} on Over 7"
                play_over
              else
                puts "You don't have enough"
                menu #TODO: make it go to casino menu
              end
        when "3"
          puts "Place your bet."
              @bet = gets.to_i
              if @bet < @player.bank_roll
                puts "You are betting $#{@bet} on 7"
                play_seven
              else
                puts "You don't have enough"
                @casino.menu
              end
        # when "4"
        #       @casino.menu
        else
          puts "I didn't understand; please enter number 1-4."
      end
  end

  def play_under
      dice
      sum = @die1 + @die2
      if sum < 7
      puts "You win."
      win
    else
      puts "You lose."
      lose
    end
  end

  def play_over
    dice
    sum = @die1 + @die2
    if sum > 7
      puts "You win."
      win
    else
      puts "You lose."
      lose
    end
  end

  def play_seven
    dice
    sum = @die1 + @die2
    if sum == 7
      puts "You win."
      seven_win
    else
      puts "You lose."
      lose
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

  def dice
    @die1 = 1 + rand(6)
    @die2 = 1 + rand(6)
    print "Sum of dice is ", @die1 + @die2, ".\n"
  end

  def seven_win
    @player.bank_roll = @player.bank_roll + (@bet * 4)
    @wallet = @player.bank_roll
    puts "You won!! You now have: $#{@wallet}".colorize(:green)
    play_again
  end

  def win
    @player.bank_roll = @player.bank_roll + (@bet * 2)
    @wallet = @player.bank_roll
    puts "You won!! You now have: $#{@wallet}".colorize(:light_blue)
    play_again
  end

  def lose
    @player.bank_roll = @player.bank_roll - @bet
    @wallet = @player.bank_roll
    puts "You lost, you now have: $#{@wallet}".colorize(:red)
    play_again
  end

end
