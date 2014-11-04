class Cookbook
	attr_accessor :title
	attr_accessor :recipes

	def initialize(title)
		@title = title
		@recipes = []
	end	

	def add_recipe(recipe)
		@recipes.push(recipe)
	end

	def recipe_titles
		@recipes.each do |sub_array|
			sub_array.each do |title, ingredients, steps|
				puts title
			end
		end
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
