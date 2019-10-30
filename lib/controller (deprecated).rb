require_relative 'view'
require_relative 'recipe'
require_relative 'scrape_letscookfrench_service'

class Controller
  def initialize(cookbook, view = View.new)
    @cookbook = cookbook
    @view = view
  end

  def list
    @view.display_recipes(@cookbook.all)
  end

  def create
    arr = @view.ask_recipe
    new_recipe = Recipe.new({name: arr[0], description: arr[1], prep_time: arr[2], difficulty: arr[3]})
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    recipe_index = @view.destroy_recipe(@cookbook.all)
    @cookbook.remove_recipe(recipe_index)
  end

  def import_list
    keyword = @view.import_ingredient
    recipe_list = ScrapeLetsCookFrenchService.new(keyword).list
    recipe_list.map! { |recipe| Recipe.new({name: recipe[0], description: recipe[1], prep_time: recipe[2], difficulty: recipe[3]}) }
    new_recipe = @view.import_recipe(recipe_list)
    @cookbook.add_recipe(new_recipe)
  end

  def mark_done
    recipe_index = @view.mark_done(@cookbook.all)
    @cookbook.mark_done(recipe_index)
  end
end

