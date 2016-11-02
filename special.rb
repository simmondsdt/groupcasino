class Special

  attr_accessor :player, :casino

  def initialize(player, casino)
    @player = player
    @casino = casino
    @random = [@beer, @margarita, @shots]
    puts "Welcome to the Bar #{@player.name}"
    play
  end

  def play
    get
    puts "What would you like to drink"
    choice = gets.strip
    case choice
    when "1"
      beer
    when "2"
      margarita
    when "3"
      wine
    when "4"
      shots
    end
  end

  def get
    puts "You have $#{@player.bank_roll} to order with"
    puts "--The Bar Menu--"
    puts "1: Beer"
    puts "2: Margarita"
    puts "3: Wine"
    puts "4: Just take shots!"
  end

  def beer
    puts "\n\nOne beer led to another and you payed $5000 to replace a slot machine you broke"
    puts "The hospital bill for your hand surgery was $1000"
    @player.bank_roll = @player.bank_roll - 6000
    @wallet = @player.bank_roll
    puts "You have $#{@player.bank_roll}"; sleep 5
    @casino.menu
  end

  def margarita
    puts "\n\nYou met a fancy lady and took her to a hotel"
    puts "All she did was eat like a homeless person and ordered $1000 worth of room service, she didn't even share!!"
    puts """
       __________________
      |                  |
      |       Bill       |
      |                  |
      |  Room.....$1000  |
      |  Service...$200  |
      |  Cleaning..$100  |
      |                  |
      |  Salmon....$300  |
      |  Lobster...$200  |
      |  Steak.....$100  |
      |  Soup......$150  |
      |  Milkshake..$50  |
      |  Milkshake..$50  |
      |  Potatoes...$50  |
      |  Veggies....$50  |
      |  Fruit......$50  |
      |                  |
      |  Total....$2300  |
       ------------------

    """.colorize(:peach)
    @player.bank_roll = @player.bank_roll - 2300
    @wallet = @player.bank_roll
    puts "You have #{@player.bank_roll}"; sleep 5
    @casino.menu
  end

  def wine
    puts "\n\nThe wine was drugged and you wake up in a dumpster"
    puts "You lost all your money"
    @player.bank_roll = @player.bank_roll - @player.bank_roll
    @wallet = @player.bank_roll
    puts "You have $#{@player.bank_roll}"; sleep 5
    @casino.menu
  end

  def shots
    puts "\n\nYou got wasted with Bill Gates and in a drunken rage he smashed your Macbook Pro and stole $10000!"
    puts "It cost you $1500 to buy a new Macbook"
    puts """
       _____________________________________________________________
      |Windows 95|                                              | x |
      |-------------------------------------------------------------|
      |                                                             |
      |   the following error occured trying to save your changes   |
      |            the operation completed successfully             |
      |                       ______                                |
      |                       | ok |                                |
      |                       ------                                |
      |_____________________________________________________________|

    """.colorize(:grey)
    @player.bank_roll = @player.bank_roll - 11500
    @wallet = @player.bank_roll
    puts "You have $#{@player.bank_roll}"; 5
    @casino.menu
  end

end
