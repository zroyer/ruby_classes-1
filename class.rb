class Marker
	def set_color(my_color)
		@color = my_color
	end
	
	def write
		Kernel.puts("I am writing with a #{@color} marker!")
	end
end