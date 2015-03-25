class Player
	attr_accessor :name, :hand

	def initialize
		@name  = name
		@hand  = []
	end

	def score
		# total sum of @hand array
		hand.inject(:+)
	end

	# def hit?(response)
	# 	if response == 'y'
	# 		true
	# 	elsif response == 'n'
	# 		false
	# 	else 
	# 		false
	# 	end
	# end
end