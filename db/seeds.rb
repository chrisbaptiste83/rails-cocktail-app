require "json"
require "net/http"
require "uri"
require "open-uri"

# Clear existing data
puts "Clearing existing data..."
Comment.destroy_all
RecipeIngredient.destroy_all
Ingredient.destroy_all
CocktailRecipe.destroy_all
Category.destroy_all
User.destroy_all
puts "Existing data cleared."

# Create Users
puts "Creating users..."
users = []
5.times do
  users << User.create!(
    username: Faker::Internet.unique.username(separators: %w(. _ -)),
    email: Faker::Internet.unique.email,
    password: "password",
    password_confirmation: "password"
  )
end
puts "Created #{users.count} users."

# Fetch cocktails from TheCocktailDB (defaults to public test key "1")
def fetch_cocktaildb(endpoint)
  api_key = ENV.fetch("COCKTAILDB_API_KEY", "1")
  uri = URI("https://www.thecocktaildb.com/api/json/v1/#{api_key}/#{endpoint}")
  response = Net::HTTP.get_response(uri)
  return {} unless response.is_a?(Net::HTTPSuccess)
  JSON.parse(response.body)
rescue StandardError => e
  puts "CocktailDB fetch failed: #{e.message}"
  {}
end

def build_recipe_from_cocktaildb!(drink, users)
  category = Category.find_or_create_by!(name: drink["strCategory"].presence || "House Specials")
  user = users.sample

  description = [
    drink["strAlcoholic"],
    drink["strGlass"],
    drink["strTags"]
  ].compact.join(" · ")
  description = "Crafted from the lounge's archive." if description.blank?

  directions = drink["strInstructions"].to_s.strip
  directions = "Shake with ice, strain into a chilled glass, garnish, and serve." if directions.blank?

  cocktail_recipe = category.cocktail_recipes.create!(
    user: user,
    title: drink["strDrink"].to_s.strip,
    description: description,
    directions: directions
  )

  (1..15).each do |idx|
    ingredient_name = drink["strIngredient#{idx}"].to_s.strip
    next if ingredient_name.blank?

    ingredient = Ingredient.find_or_create_by!(name: ingredient_name)
    quantity = drink["strMeasure#{idx}"].to_s.strip.presence || "to taste"
    RecipeIngredient.create!(
      cocktail_recipe: cocktail_recipe,
      ingredient: ingredient,
      quantity: quantity
    )
  end

  image_url = drink["strDrinkThumb"].to_s.strip
  if image_url.present?
    begin
      file = URI.open(image_url)
      cocktail_recipe.avatar.attach(io: file, filename: "#{cocktail_recipe.title.parameterize}.jpg", content_type: "image/jpeg")
    rescue StandardError => e
      puts "Image attach failed for #{cocktail_recipe.title}: #{e.message}"
    end
  end

  rand(2..4).times do
    commenter = users.sample
    Comment.create!(
      cocktail_recipe: cocktail_recipe,
      user: commenter,
      content: Faker::Lorem.sentence(word_count: rand(6..14))
    )
  end
end

puts "Fetching cocktails from TheCocktailDB..."
drinks = []
%w[a b c m s].each do |letter|
  response = fetch_cocktaildb("search.php?f=#{letter}")
  drinks.concat(response.fetch("drinks", []))
end
drinks = drinks.uniq { |drink| drink["idDrink"] }.sample(20)
puts "Pulled #{drinks.count} cocktails from TheCocktailDB."

puts "Creating cocktail recipes, recipe ingredients, and comments..."
if drinks.any?
  drinks.each { |drink| build_recipe_from_cocktaildb!(drink, users) }
else
  puts "No CocktailDB drinks found, falling back to Faker data."

  categories = []
  5.times do
    categories << Category.create!(
      name: Faker::Dessert.unique.topping.capitalize
    )
  end

  ingredients = []
  20.times do
    ingredients << Ingredient.create!(
      name: Faker::Food.unique.ingredient.capitalize
    )
  end

  categories.each do |category|
    8.times do
      user = users.sample
      cocktail_recipe = category.cocktail_recipes.create!(
        user: user,
        title: Faker::Food.unique.dish.capitalize,
        description: Faker::Lorem.paragraph(sentence_count: 2),
        directions: Faker::Lorem.paragraphs(number: 3).join("\n")
      )

      ingredients.sample(rand(3..5)).each do |ingredient|
        RecipeIngredient.create!(
          cocktail_recipe: cocktail_recipe,
          ingredient: ingredient,
          quantity: "#{rand(1..5)} #{Faker::Measurement.volume}"
        )
      end

      rand(3..5).times do
        commenter = users.sample
        Comment.create!(
          cocktail_recipe: cocktail_recipe,
          user: commenter,
          content: Faker::Lorem.sentence(word_count: rand(5..15))
        )
      end
    end
  end
end

puts "Created cocktail recipes, recipe ingredients, and comments."

puts "Seed data creation complete!"
