class Player
  attr_accessor :name, :bank_roll

  def initialize
    puts "What's your name player?"
    @name = gets.strip
    #TODO: error checking around getting valid name
    # TODO: figure out what we want to do with bankroll: random? ask_user?
    # Do we want bank roll to be a float? (we should install the currency gem?)
    # Player should have a wallet - when player gets created a new wallet instance is created
    # create a wallet class
    @bank_roll = 100
  end

end
