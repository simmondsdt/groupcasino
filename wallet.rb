class Wallet
  attr_accessor :bank_begin, :bank_end, :bet_amount

  def initialize
    puts "How much do you have in your wallet?"
    user_amount = gets.to_i
    bank_begin = user_amount
    puts "You have $#{@bank_begin}!"
  end

 def bet_amount
  puts "How much would you like to bet?"
  bet_amount = gets.to_i
  puts "You are betting $#{@bet_amount}"
end

  def win_bet
    puts "You won #{@win_amount}!!"
    bank_total = @bank_begin + @win_amount
    puts "You now have"
    bank_total
    puts "Would you like to keep playing? (y/n)"
      keep = gets.strip.downcase
      if keep == 'y'
        highlow
      elsif keep == 'n'
        menu
      else
        puts "Please put a valid option"
      end
  end

  def lose_bet
    puts "Womp, womp, you lost #{@bet_amount}."
    bank_left = @bank_begin - @bet_amount
    puts "You now have"
    bank_left
    @bank_end = bank_left
    if @bank_end < 10.0
    puts "Buy in minumum is $10. Would you like to add money to keep playing? (y/n)"
      keep = gets.strip.downcase
      if keep == 'y'
        add_money
      elsif keep == 'n'
        menu
      if @bank_end > 10.0
    puts "Would you like to keep playing? (y/n)"
      keep = gets.strip.downcase
      if keep == 'y'
        highlow
      elsif keep == 'n'
        menu
  end

  def add_money
    puts "How much would you like to add to your wallet?"
    user_amount = gets.to_i
    @bank_begin = user_amount + @bank_end
    puts "You now have $#{@bank_begin}"
    menu
end

end
