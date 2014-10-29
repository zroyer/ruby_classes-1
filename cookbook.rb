class Cookbook
	def initialize(title)
		@title = title
	end

	def title
		@title
	end
end


class Recipe
	def initialize(title, ingredients, steps)
		@title = title
		@ingredients = ingredients
		@steps = steps
	end

	def title
		@title
	end

	def ingredients
		@ingredients
	end

	def steps
		@steps
	end
end
