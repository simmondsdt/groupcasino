class Player

  attr_accessor :name, :bank_roll

  def initialize
    puts "\nWhat's your name player?"
      @name = gets.strip
      if @name.empty?
        puts "Please put a name"
        Player.new
      else
        puts "\nHow much money do you have in your wallet #{@name}?"
          amount = gets.strip.to_i
          if amount < 10000
            @bank_roll = amount
          else
            puts "You don't have that much, get a loan!"
          end
      end
  end

end
