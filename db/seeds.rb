user = User.create!(username: "testuser", email: "test@example.com", password: "password", password_confirmation: "password")

martini = Category.create!(name: "Martinis")
martini.cocktail_recipes.create!(title: "Vodka Martini", description: "A classic cocktail.", directions: "Mix all ingredients.", user: user)
martini.cocktail_recipes.create!(title: "Gin Martini", description: "A classic gin cocktail.", directions: "Mix gin and vermouth.", user: user)
martini.cocktail_recipes.create!(title: "Pineapple Martini", description: "A fruity martini.", directions: "Shake with ice, strain.", user: user)

colada = Category.create!(name: "Colada")
colada.cocktail_recipes.create!(title: "Pina Colada", description: "A tropical delight.", directions: "Blend with ice.", user: user)