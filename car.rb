class Car
	def initialize
		@fuel = 10
		@distance = 0
	end

	def get_info
		"I'm a car! I've driven #{@distance} miles and have #{@fuel} gallons of gas left"
	end

	def drive(miles)
		if (@fuel*20 - miles) > 0
			@distance += miles
			@fuel -= miles/20.0			
		else
			"You don't have enough gas. Please fuel up to continue."
		end
	end

	def fuel_up
		diff = 10 - @fuel
		cost = diff * 3.50
		puts "You currently have #{@fuel} gallons of gas. At the rate of $3.50/gallon, it will cost you $#{cost} to fill your gas tank. Your tank has been filled."
		@fuel = 10
	end
end
