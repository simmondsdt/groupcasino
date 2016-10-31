require 'pry'
require 'colorize'
#any other gems we want put here

require_relative 'player'
require_relative 'highlow'
# require_relative 'wallet'

class Casino
  attr_accessor :player

  def initialize
    puts 'Welcome to the ruby CASINO!'.colorize(:yellow)
    @player = Player.new
    menu
  end

  def menu_options # prints the options for the casino
    puts "1: High Low Game"
    puts "2: Get more money"
    puts "3: Exit"
  end

  # # TODO: link this to the wallet class to get more money
  # def get_money # will get money from the atm
  #   puts "How much money would you like to get from the ATM?"
  #   money = gets.strip.to_i
  #   puts "Getting your money"; sleep 1
  #   puts "Was successfully added to your bankroll!"
  #   # TODO: have it push the amount to the bankroll
  #   menu
  # end

  def menu
    puts "What game would you like to play?"
    menu_options
    choice = gets.strip.to_i
    case choice
      when 1
        HighLow.new(player) #this passes the whole player object
      when 2
        get_money #go to get money
      when 3
        puts "Goodbye" #lets user exit
        exit
      else
        puts "Please put a valid option" #error checking
      end
  end
end

Casino.new
