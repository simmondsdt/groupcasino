class Player

  attr_accessor :name, :bank_roll

  def initialize
    puts "What's your name player?"
      @name = gets.strip
    puts "How much money do you have in your wallet"
      amount = gets.strip.to_i
      if amount < 5000
        @bank_roll = amount
      else
        puts "You don't have that much, get a loan!"
      end
    #TODO: error checking around getting valid name
    # TODO: figure out what we want to do with bankroll: random? ask_user?
    # Do we want bank roll to be a float? (we should install the currency gem?)
  end
end
