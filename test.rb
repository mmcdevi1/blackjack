require 'pry'
 
def play_game name
  deck = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"]
  suits = ["H", "D", "C", "S"]
 
  shuffled_deck = (deck.product(suits) * 3).shuffle
 
  player_hand = []
  dealer_hand = []
 
  2.times do 
    player_hand << shuffled_deck.pop
    dealer_hand << shuffled_deck.pop
  end
 
  player_total = calculate_total (player_hand)
  dealer_total = calculate_total (dealer_hand)
 
  if player_total == 21
    display_cards player_hand, dealer_hand
    puts "Congratulations, #{name}! You just hit Blackjack."
    return 1
  elsif dealer_total == 21
    display_cards player_hand, dealer_hand
    puts "So sorry, #{name}! I just hit Blackjack."
    return -1
  end
 
  puts "Here are your cards, #{name}: #{player_hand}"
  puts "Do you want to hit or stay? Select 'H' for 'Hit' or 'S' for 'Stay'"
  hit_or_stay = gets.chomp
 
  while hit_or_stay.upcase != "S" do
    if hit_or_stay.upcase == "H"
      player_hand << shuffled_deck.pop
      player_total = calculate_total (player_hand)
      if player_total > 21
        display_cards player_hand, dealer_hand
        puts "So sorry, #{name}, but I'm afraid that you're busted!"
        return -1
      end
    elsif hit_or_stay.upcase != "S"
      puts "Please select 'H' for 'Hit' or 'S' for 'Stay'."
    end
    puts "Here are your cards, #{name}: #{player_hand}"
    puts "Do you want to hit or stay? Select 'H' for 'Hit' or 'S' for 'Stay'."
    hit_or_stay = gets.chomp
  end
 
  while dealer_total < 17 do
    dealer_hand << shuffled_deck.pop
    dealer_total = calculate_total (dealer_hand)
    if dealer_total > 21
      display_cards player_hand, dealer_hand
      puts "Great news, #{name}! I just got busted. You won!"
      return 1
    end
  end
 
  display_cards player_hand, dealer_hand
 
  if player_total > dealer_total
    puts "Congratulations, #{name}! You won!"
    return 1
  elsif dealer_total > player_total
    puts "Sorry about that, #{name}! I won. Better luck next time!"
    return -1
  else
    puts "You're not going to believe this, #{name}, but it's a tie!"
    return 0
  end
end
 
def calculate_total (hand)
  total = 0
  hand.collect {|ind| ind[0]}.each do |element|
    if element == "J" || element == "Q" || element == "K"
      total += 10
    elsif element == 1
      total += 11
    else
      total += element
    end
  end
  hand.collect {|ind| ind[0]}.each do |element|
    if total > 21 && element == 1
      total -= 10
    end
  end
  return total
end
 
def display_cards player_hand, dealer_hand
  puts "My cards: #{dealer_hand}"
  puts "My total: #{calculate_total(dealer_hand)}"
  puts "Your cards: #{player_hand}"
  puts "Your total: #{calculate_total(player_hand)}"
end
 
puts "Welcome to Blackjack!"
puts "I'm going to be the dealer, and my name is Joe."
puts "If you don't mind me asking, what's your name?"
name = gets.chomp
puts "Nice to meet you, #{name}! Let's get started."
puts
 
tally = play_game name
 
play_again = "Y"
while play_again.upcase == "Y" do
  plural = tally.abs == 1 ? "" : "s"
  if tally > 0
    puts "Congratulations!  You are ahead by #{tally} game#{plural}."
  elsif tally < 0
    puts "Today is not your day. I am ahead by #{tally.abs} game#{plural}."
  else
    puts "Looks like we're tied on games won."
  end
  puts "Would you like to play again? Please type in 'Y' for 'Yes' and 'N' for 'No'."
  play_again = gets.chomp
  until ["Y", "N"].include?(play_again.upcase) do
    puts "Oops! Please type in 'Y' for 'Yes' and 'N' for 'No'."
    play_again = gets.chomp
  end
  if play_again.upcase == "N"
    puts "Thanks for playing Blackjack!"
  else
    tally += play_game name
  end
end