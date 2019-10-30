require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @csv_file = csv_file_path
    @recipes = []
    read_csv
  end

  def all
    @recipes
  end

  def add_recipe(new_recipe)
    @recipes.push(new_recipe)
    update_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    update_csv
  end

  def mark_done(recipe_index)
    @recipes[recipe_index].mark_done!
    update_csv
  end
  # TO-DO (improvement): put headers on CSV and use them as keys instead of row[index]
  def read_csv
    CSV.read(@csv_file).each do |row|
      @recipes.push(Recipe.new({name: row[0], description: row[1], prep_time: row[2], difficulty: row[3], done: row[4]}))
    end
  end

  def update_csv
    CSV.open(@csv_file, 'wb') do |row|
      @recipes.each { |recipe| row << [recipe.name, recipe.description, recipe.prep_time, recipe.difficulty, recipe.done?] }
    end
  end
end

# ------ TESTING ------

# cb = Cookbook.new("lib/recipes.csv")
# rec = {name: "suco", description: "verde"}
# rec2 = {name: "arroz", description: "frito"}

# p cb.add_recipe(rec)
# p cb.add_recipe(rec2)
# p cb.all

