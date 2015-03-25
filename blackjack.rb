require './deck.rb'
require './player.rb'
require './dealer.rb'

class BlackJack
	attr_accessor :player, :dealer
	attr_reader :deck

	def initialize
		@deck   = Deck.new.cards
		@dealer = Dealer.new
		@player = Player.new
		game
	end

	def deal_to_player
		player.hand.push(deck.first)
		deck.delete_at(0)
	end

	def deal_to_dealer
		dealer.hand.push(deck.first)
		deck.delete_at(0)
	end

	def deal_cards
		2.times do
			deal_to_player
			deal_to_dealer
		end
	end

	def game
		puts "-" * 30
		puts "Let's play BlackJack"
		puts "-" * 30
		print "Enter your name: "
		player.name = gets.chomp.capitalize
		puts "-" * 30

		deal_cards

		puts "#{player.name}'s Cards: 2 of H and 4 Of D  #{player.hand}"
		# puts "Dealers Cards: #{dealer.hand} => #{dealer.score}"

		# puts "-" * 30
		

		# while player.score <= 21
		# 	print "Hit? y/n "
		# 	response = gets.chomp.downcase
		# 	deal_to_player if player.hit?(response) == true
		# 	puts "#{player.name}'s Cards: #{player.hand} => #{player.score}"
		# 	break if player.hit?(response) == false
		# 	if player.score == 21
		# 		puts "You hit 21!"
		# 	end
		# 	if player.score > 21
		# 		puts "you lose"
		# 	end
		# end

		# unless player.score > 21
		# 	while dealer.score < 17
		# 		deal_to_dealer
		# 		puts "Dealers Cards: #{dealer.hand} => #{dealer.score}"
		# 	end

		# 	if dealer.score > 21
		# 		puts "You win!"
		# 	elsif player.score > dealer.score
		# 		puts "You win!"
		# 	elsif dealer.score > player.score && dealer.score < 21
		# 		puts "Dealer wins!"
		# 	elsif dealer.score == player.score
		# 		puts "Draw!"
		# 	end
		# end










		
	end
end

BlackJack.new







































