require 'pry'
require 'colorize'
#any other gems we want put here

require_relative 'player'
require_relative 'highlow'

class Casino
  attr_accessor :player

  def initialize
    puts 'Welcome to the ruby CASINO!'.colorize(:yellow)
    @player = Player.new
    menu
  end

  #TODO: figure out how we want our menu
  def menu
    # get more money
    # play highlow - HighLow.new - initialize gets called - every new instance of game, pass player object in
    HighLow.new(player) #this passes the whole player object
    # add a quit option
  end
end

Casino.new
