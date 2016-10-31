require 'pry'
require 'colorize'
#any other gems we want put here

class Casino
  def initialize
    puts 'Welcome to the ruby CASINO!'.colorize(:yellow)
    @player = Player.new
    menu
  end

  #TODO: figure out how we want our menu
  def menu
  end
end

Casino.new
