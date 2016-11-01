require 'pry'
require 'colorize'

require_relative 'player'
require_relative 'highlow'
require_relative 'slots'
require_relative 'chohan'
require_relative 'roulette'
require_relative 'underover7'

class Casino

  attr_accessor :player

  def initialize
    @players = []
    puts 'Welcome to the ruby CASINO!'.colorize(:yellow)
    @player = Player.new
    @players << @player
    menu
  end

  def menu_options # prints the options for the casino
    puts "1: Play High Low Game"
    puts "2: Play Slots"
    puts "3: Play ChoHan"
    puts "4: Play Roulette"
    puts "5: Play Under Over 7"
    puts "6: Add Money"
    puts "7: View Profiles"
    puts "8: Exit"
  end

  def get_money
    puts "How much would you like to add to your wallet?"
    amount = gets.strip.to_i
    if amount < 10000
      @player.bank_roll = @player.bank_roll + amount
      puts "You now have $#{@player.bank_roll}"
      menu
    else
      puts "You don't have a good enough credit score to borrow that much!"
      menu
    end
  end

  def profile
    puts "Would you like to view players or add a new one?"
    puts "1: View Players"
    puts "2: Add Players"
    user = gets.strip.to_i
    if user == 1
      @players.each_with_index { |x, i| puts "#{i + 1} #{x.name.capitalize} \t$#{x.bank_roll}" }
      puts "What player would you like to choose?"
      choose = gets.strip
      case choose
        when "1"
          @player = @players[0]
        when "2"
          @player = @players[1]
        when "3"
          @player = @players[2]
        when "4"
          @player = @players[3]
      end
      puts "You chose #{player.name.capitalize}!!"
      menu
    else
      if @players.count < 4
        @player = Player.new
        @players << @player
      else
        puts "There are only 4 of your people allowed in the VIP Room\n"
      end
      menu
    end
  end

  def menu
    puts "\nWhat game would you like to play?"
    menu_options
    choice = gets.strip
    case choice
      when "1"
        HighLow.new(player, self) #this passes the whole player object
      when "2"
        Slots.new(player, self)
      when "3"
        ChoHan.new(player, self)
      when "4"
        Roulette.new(player, self)
      when "5"
        UnderOver7.new(player, self)
      when "6"
        get_money
      when "7"
        profile
      when "8"
        puts "Goodbye" #lets user exit
        exit
      else
        puts "Please put a valid option" #error checking
        menu
      end
  end
end

Casino.new
