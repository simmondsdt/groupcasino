class HighLow

  def initialize(player)
    puts "Welcome to High Low: #{player.name}"
    puts "You have #{player.bank_begin} dollars to play with!\n"
    highlow_menu
  end

  def highlow_menu
    puts '1. Play HighLow (type 1)'
    puts '2. Quit (type 2)'
    menu_choice = gets.to_i
      case menu_choice
        when 1
          play
        when 2
          menu
        else
          puts "I didn't understand; enter number 1 to play or 2 to play a diferent game"
      end
  end

  def play
    puts 'Pick a number between 1 and 100'
    @dealer_number = rand(1..100)
    again
  end

  def again
  guess = gets.strip.to_i
    if guess != @dealer_number
      if guess > @dealer_number
        puts "That's too high. Try again: "
        again
      else
        puts "That's too low. Try again: "
        again
      end
    elsif guess == @dealer_number
      puts "You won!!!"
      @menu
    else
      puts "Please input a valid number"
      again
    end
  end

end

# highlow_1 = HighLow.new
