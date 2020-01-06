require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

require_relative 'lib/cookbook'
# require_relative 'lib/scrape_letscookfrench_service'       #----- ERROR ???

csv_file = File.join(__dir__, 'lib/recipes.csv')
cookbook = Cookbook.new(csv_file)

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do
  @recipes = cookbook.all
  erb :index
end

get '/new' do
  erb :new
end

# PENDING ------------------------------------
get '/edit/:index' do
  erb :edit
end
# PENDING (END) ------------------------------------

post '/new' do
  # binding.pry
  new_recipe = Recipe.new(params)
  cookbook.add_recipe(new_recipe)
end

get '/about' do
  erb :about
end