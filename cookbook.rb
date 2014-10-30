class Cookbook
	attr_accessor :title
	attr_accessor :recipes

	def initialize(title)
		@title = title
		@recipes = []
	end	

	def add_recipe(Recipe)
		@recipes.push(Recipe.new)
	end
end


class Recipe
	attr_accessor :title 
	attr_accessor :ingredients 
	attr_accessor :steps

	def initialize(title, ingredients, steps)
		@title = title
		@ingredients = ingredients
		@steps = steps
	end
end
