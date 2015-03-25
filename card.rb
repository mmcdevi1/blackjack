class Card
	attr_accessor :value, :suit

	def initialize(value, suit, face)
		@value  = value
		@suit   = suit
		@face   = face
	end

end