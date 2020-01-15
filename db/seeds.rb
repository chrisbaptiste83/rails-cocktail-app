martini = Category.create!(name: "Martinis")
martini.cocktail_recipes.create!(title: "Vodka Martini")
martini.cocktail_recipes.create!(title: "Gin Martini")
martini.cocktail_recipes.create!(title: "Pinapple Martini")
 
colada = Category.create!(name: "Colada")
colada.cocktail_recipes.create!(title: "Pina Colada")