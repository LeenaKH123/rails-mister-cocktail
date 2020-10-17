require 'open-uri'
require 'json'

puts "cleaning the database"
Cocktail.destroy_all
Ingredient.destroy_all

# puts "started creating cocktails"
# coc1 = Cocktail.new(name: "Pina Colada", photo: "https://images.unsplash.com/photo-1560179304-6fc1d8749b23?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60")
# coc1.save!
# coc2 = Cocktail.new()
# coc2.save!
# coc3 = Cocktail.new()
# coc3.save!
# coc4 = Cocktail.new()
# coc4.save!
# puts "4 cocktails were created"



puts "reading JSON list"
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
drinklist = open(url).read
drinks = JSON.parse(drinklist)["drinks"] # i dont understand this part
drinks.each do |drink|
  ingredient = Ingredient.new(
    name: drink["strIngredient1"]
  )
  ingredient.save!
  puts "#{ingredient.name} created!"
end
puts "Seeded ended!"

# solved the problem by:
# 1. type --> byebug on line 8
# 2. run --> rails db:seed in the terminal
# 3. type --> the below in the terminal
# *******************
# 8: byebug
# =>  9: counter = 0
#    10: drinks.each do |drink|
#    11:   ingredient = Ingredient.new(
#    12:     name: drink[counter]
#    13:   )
# (byebug) drinks.class
# Hash
# (byebug) drinks.keys
# ["drinks"]
# (byebug) drinks.values

