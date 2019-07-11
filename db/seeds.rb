# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts 'Clearing database'

Ingredient.delete_all
Cocktail.delete_all

puts 'Calling json api'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
get_json = open(url).read
ingredients_hash = JSON.parse(get_json)

puts 'Injecting ingredients'

ingredients_hash['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
  # Ingredient.create(name: ingredient)
end

puts "Injecting cocktails"

20.times do
  Cocktail.create(name: Faker::Cannabis.strain)
end

puts 'Seed succesful'
