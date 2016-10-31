class HighLow

  # attr_accessor :name, :bank_begin
  attr_accessor :player, :name, :bank_begin

  def initialize(player, name, bank_begin)
    @player = player
    @name = name
    @bank_begin = bank_begin
    puts "Welcome to High Low: #{player.name}"
    puts "You have #{player.bank_begin} dollars to play with!\n"
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
      while guess != dealer_number
        case guess
          when guess > dealer_number
            puts "That's too high.  Guess again: "
            guess = gets.strip.to_i
            count += 1
          when guess < dealer_number
            puts "That's too low.  Guess again: "
            guess = gets.strip.to_i
            count += 1
          else
            break
        end
      end
  end

end

HighLow.new(@player, @name, @bank_begin)

