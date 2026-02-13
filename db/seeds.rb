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

# Curated cocktail-themed usernames
CANTINA_USERNAMES = %w[
  BarkeepMike
  MixologyMaven
  ShakerSteve
  CitrusSally
  BittersBoss
  RyeGuy
  GinAndJulia
  TheNeatPour
].freeze

# Curated realistic cocktail-themed comments
COCKTAIL_COMMENTS = [
  "Perfectly balanced — the citrus cuts right through the sweetness.",
  "This is my go-to Friday night pour. Never gets old.",
  "Made this for a dinner party and everyone asked for the recipe!",
  "The garnish really makes this one. Don't skip it.",
  "I subbed in mezcal and it added a beautiful smoky layer.",
  "Dangerously smooth. You forget there's booze in it.",
  "A classic done right. No need to reinvent the wheel here.",
  "Tried it with a splash of grapefruit juice — incredible twist.",
  "This one hits different on a warm evening with good company.",
  "I've been bartending for ten years and this is still one of my favorites.",
  "A little too sweet for my taste, but dialing back the syrup fixed it.",
  "The bitters really tie everything together. Chef's kiss.",
  "Shaken, not stirred — and it makes all the difference.",
  "Served this at brunch and it was the star of the table.",
  "I love how the herbal notes come through at the finish.",
  "Refreshing and crisp. Perfect poolside drink.",
  "The egg white gives it such a silky mouthfeel. Worth the extra step.",
  "Not my usual style, but I'm completely converted now.",
  "Pro tip: use a large ice cube. It changes the whole experience.",
  "This recipe introduced me to my new favorite spirit.",
  "Elegant and understated. Let the ingredients speak for themselves.",
  "The aroma alone is worth making this cocktail.",
  "Finally, a recipe that actually tastes like it does in the bar.",
  "I doubled the batch for a party. Zero regrets.",
  "Simple ingredients, complex flavors. That's the mark of a great cocktail.",
  "Added a sprig of rosemary and it elevated everything.",
  "This is liquid velvet. Absolutely stunning.",
  "A bold choice that pays off beautifully.",
  "The balance between bitter and sweet here is perfection.",
  "I keep coming back to this one. It's become a house favorite.",
  "Great gateway cocktail for friends who think they don't like spirits.",
  "The color on this one is gorgeous. Looks as good as it tastes.",
  "Took me three tries to get the proportions right, but so worth it.",
  "This pairs incredibly well with charcuterie.",
  "I appreciate how the recipe respects the classics while adding a twist.",
  "Smoother than expected. The dilution ratio is spot on.",
  "My partner says this is the best cocktail I've ever made.",
  "The layering technique really shows — each sip is slightly different.",
  "If you have good ice, this cocktail will reward you for it.",
  "Bookmarked. This is going into my permanent rotation."
].freeze

# Create Users
puts "Creating users..."
users = CANTINA_USERNAMES.map do |username|
  User.create!(
    username: username,
    email: "#{username.downcase.gsub(/[^a-z0-9]/, '')}@mikescantina.com",
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

def build_recipe_from_cocktaildb!(drink, users, comments_pool)
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

  rand(2..5).times do
    commenter = users.sample
    Comment.create!(
      cocktail_recipe: cocktail_recipe,
      user: commenter,
      content: comments_pool.sample
    )
  end
end

puts "Fetching cocktails from TheCocktailDB..."
drinks = []
("a".."z").each do |letter|
  response = fetch_cocktaildb("search.php?f=#{letter}")
  fetched = response.fetch("drinks", nil)
  drinks.concat(fetched) if fetched.is_a?(Array)
end
drinks = drinks.uniq { |drink| drink["idDrink"] }.sample(50)
puts "Pulled #{drinks.count} cocktails from TheCocktailDB."

puts "Creating cocktail recipes, recipe ingredients, and comments..."
if drinks.any?
  drinks.each { |drink| build_recipe_from_cocktaildb!(drink, users, COCKTAIL_COMMENTS) }
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
          content: COCKTAIL_COMMENTS.sample
        )
      end
    end
  end
end

puts "Created cocktail recipes, recipe ingredients, and comments."

puts "Seed data creation complete!"
