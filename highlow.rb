class HighLow

  attr_accessor :dice

  def initialize(player)
    puts "Welcome to High Low: #{player.name}"
    puts "You have #{player.bank_roll} dollars to play with!\n"
  end

  def highlow_menu
    puts '1. Play HighLow (type 1)'
    puts '2. Quit (type 2)'
    menu_choice = gets.to_i
      case menu_choice
        when 1
          play
        when 2
          exit
        else
          puts "I didn't understand; enter number 1 to play or 2 to quit"
      end
  end

  def play
    puts 'Pick a number between 1 and 100'
    guess = gets.strip.to_i
    dealer_number = rand(1..100)
#      case
#        when
#      end

  end

end
