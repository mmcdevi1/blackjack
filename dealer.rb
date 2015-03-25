class Dealer
	attr_accessor :hand

	def initialize
		@hand = []
	end

	def score
		# total sum of @hand array
		hand.inject(:+)
	end
end