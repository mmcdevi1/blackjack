require './card.rb'

class Deck
	attr_accessor :cards

	def initialize
		@cards = []
		create_deck
		shuffle
	end

	def create_deck
		suits  = ['H', 'D', 'S', 'C']
		values = [{'2' => 2},{'3' => 3},{'4' => 4},{'5' => 5},{'6' => 6},
							{'7' => 7},{'8' => 8},{'9' => 9},{'10' => 10}, 
							{'J' => 10}, {'Q' => 10}, {'K' => 10}, {'A' => 11}] 
		values.product(suits).each do |value, suit|
			cards << Card.new(value, suit)
		end
	end

	def shuffle
		self.cards.shuffle!
	end
end