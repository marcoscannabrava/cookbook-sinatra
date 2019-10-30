class View
  def display_recipes(recipes)
    puts ""
    puts "Cookbook"
    recipes.each_with_index do |recipe, index|
      recipe.done? ? x = "X" : x = " "
      puts "#{index + 1}. [#{x}] #{recipe.name} - #{recipe.description} (#{recipe.prep_time})"
    end
    puts ""
  end

  def ask_recipe
    puts ""
    puts "Please type the name of your recipe:"
    name = gets.chomp
    puts "Please type the description of your recipe:"
    description = gets.chomp
    puts "Please type the prep time of your recipe:"
    prep_time = gets.chomp
    puts "Please type the difficulty of your recipe:"
    difficulty = gets.chomp
    return [name, description, prep_time, difficulty]
  end

  def destroy_recipe(recipes)
    puts ""
    display_recipes(recipes)
    puts "Type the number of the recipe you'd like to remove, please."
    index = gets.chomp.to_i
    return index - 1
  end

  def import_ingredient
    puts "What ingredient would you like a recipe for?"
    ingredient = gets.chomp
    return ingredient
  end

  def import_recipe(recipes)
    puts ""
    display_recipes(recipes)
    puts "Type the number of the recipe you'd like to import, please."
    index = gets.chomp.to_i
    puts "Importing \"#{recipes[index - 1].name}\"..."
    return recipes[index - 1]
  end

  def mark_done(recipes)
    puts ""
    display_recipes(recipes)
    puts "Type the number of the recipe you'd like to mark as done, please."
    index = gets.chomp.to_i
    return index - 1
  end
end