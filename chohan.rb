require 'colorize'

class ChoHan

attr_accessor :player, :casino

def initialize(player, casino)
  @player = player
  @casino = casino
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:color => :cyan, :background => :blue)
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:color => :cyan, :background => :blue)
  puts "                   Cho-Han Bakuchi                   ".colorize(:color => :light_green, :background => :blue)
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:color => :cyan, :background => :blue)
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:color => :cyan, :background => :blue)
  puts "\nA fun game of 6 dice, with a 50/50 chance of winning!\n\n"
  play
end

def play
  puts "You have $#{@player.bank_roll} to play with"
  puts "How much would you like to bet?"
  @bet = gets.to_i
  if @bet < @player.bank_roll
    puts "You are betting $#{@bet}\n"
  pick_cho_han
  else
    puts "You don't have enough money!"
    @casino.menu
  end
end

def pick_cho_han
  puts "Pick 'Cho' or 'Han'\n"
  puts "Select an option: "
  puts "1. Type 1 to bet " + "Cho".colorize(:color => :blue, :background => :light_blue) + " (even)"
  puts "2. Type 2 to bet " + "Han".colorize(:color => :light_blue, :background => :blue) + " (odd)"
  puts "Take your pick: "
  @ch_choice = gets.to_i

    case @ch_choice
      when 1
        puts "You picked Cho\n"
        roll
      when 2
        puts "You picked Han\n"
        roll
      else
        puts 'Not a valid option.'
      pick_cho_han
    end

end

def roll
 puts "\nRolling......\n".cyan.blink; sleep 1
 @die1 = 1 + rand(6)
 @die2 = 1 + rand(6)
 @die3 = 1 + rand(6)
 @die4 = 1 + rand(6)
 @die5 = 1 + rand(6)
 @die6 = 1 + rand(6)

 @sum =  @die1 + @die2 + @die3 + @die4 + @die5 + @die6

  puts "\nYou rolled #{@sum} \n\n"
    if @sum % 2 == 0
      print "It's Cho"
    compare
    else
      print "It's Han"
  compare
   end
end

def compare
  if @ch_choice == 1 && @sum.even?
    puts "...that's even - It's a match! :)"
    win
  elsif @ch_choice == 1 && @sum.odd?
    puts "...that's not a win"
    lose
  elsif @ch_choice == 2 && @sum.even?
    puts "...not a match :("
    lose
  else @ch_choice == 2 && @sum.odd?
    puts "...that's odd - a match!"
  win
end
   play_again
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
    puts "\nYou won $#{@bet * 4}!\nYou now have: $#{@wallet}".colorize(:green)
    play_again
  end

  def lose
    @player.bank_roll = @player.bank_roll - @bet
    @wallet = @player.bank_roll
    puts "\nYou lost $#{@bet}.\nYou now have: $#{@wallet}".colorize(:red)
    play_again
  end

end
