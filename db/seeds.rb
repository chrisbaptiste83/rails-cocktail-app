puts "Clearing existing data..."
Comment.destroy_all
RecipeIngredient.destroy_all
Ingredient.destroy_all
CocktailRecipe.destroy_all
Category.destroy_all
User.destroy_all
puts "Done clearing."

# ============================================================
# USERS
# ============================================================
puts "Creating users..."

u1 = User.create!(username: "BarkeepMike",    email: "barkeep.mike@cocktailden.com",     password: "password", password_confirmation: "password")
u2 = User.create!(username: "MixologyMaven",  email: "mixology.maven@stirred.com",        password: "password", password_confirmation: "password")
u3 = User.create!(username: "ShakerSteve",    email: "shaker.steve@shakehouse.com",       password: "password", password_confirmation: "password")
u4 = User.create!(username: "CitrusSally",    email: "citrus.sally@freshpress.com",       password: "password", password_confirmation: "password")
u5 = User.create!(username: "BittersBoss",    email: "bitters.boss@aromaticbar.com",      password: "password", password_confirmation: "password")
u6 = User.create!(username: "RyeGuy",         email: "rye.guy@graindistillery.com",       password: "password", password_confirmation: "password")
u7 = User.create!(username: "GinAndJulia",    email: "gin.julia@botanicalbar.com",        password: "password", password_confirmation: "password")
u8 = User.create!(username: "TheNeatPour",    email: "neat.pour@singlemalt.com",          password: "password", password_confirmation: "password")

users = [u1, u2, u3, u4, u5, u6, u7, u8]
puts "Created #{users.count} users."

# ============================================================
# CATEGORIES
# ============================================================
puts "Creating categories..."

cat_classic   = Category.create!(name: "Classic Cocktails")
cat_tiki      = Category.create!(name: "Tiki & Tropical")
cat_whiskey   = Category.create!(name: "Whiskey & Bourbon")
cat_gin       = Category.create!(name: "Gin-Based")
cat_vodka     = Category.create!(name: "Vodka Cocktails")
cat_rum       = Category.create!(name: "Rum Cocktails")
cat_tequila   = Category.create!(name: "Tequila & Mezcal")
cat_champagne = Category.create!(name: "Champagne & Wine")
cat_mocktail  = Category.create!(name: "Mocktails & Low-ABV")
cat_aperitivo = Category.create!(name: "Aperitivo & Digestivo")

puts "Created #{Category.count} categories."

# ============================================================
# INGREDIENTS
# ============================================================
puts "Creating ingredients..."

# Base spirits
bourbon           = Ingredient.create!(name: "Bourbon whiskey")
rye_whiskey       = Ingredient.create!(name: "Rye whiskey")
scotch            = Ingredient.create!(name: "Blended Scotch whisky")
irish_whiskey     = Ingredient.create!(name: "Irish whiskey")
white_rum         = Ingredient.create!(name: "White rum")
dark_rum          = Ingredient.create!(name: "Dark rum")
aged_rum          = Ingredient.create!(name: "Aged rum")
overproof_rum     = Ingredient.create!(name: "Overproof rum")
blanco_tequila    = Ingredient.create!(name: "Blanco tequila")
reposado_tequila  = Ingredient.create!(name: "Reposado tequila")
mezcal            = Ingredient.create!(name: "Mezcal")
london_dry_gin    = Ingredient.create!(name: "London dry gin")
old_tom_gin       = Ingredient.create!(name: "Old Tom gin")
vodka             = Ingredient.create!(name: "Vodka")
cognac            = Ingredient.create!(name: "Cognac")
calvados          = Ingredient.create!(name: "Calvados")

# Liqueurs & Amari
amaro_nonino      = Ingredient.create!(name: "Amaro Nonino")
amaro_averna      = Ingredient.create!(name: "Amaro Averna")
amaro_montenegro  = Ingredient.create!(name: "Amaro Montenegro")
fernet_branca     = Ingredient.create!(name: "Fernet-Branca")
campari           = Ingredient.create!(name: "Campari")
aperol            = Ingredient.create!(name: "Aperol")
sweet_vermouth    = Ingredient.create!(name: "Sweet vermouth")
dry_vermouth      = Ingredient.create!(name: "Dry vermouth")
blanc_vermouth    = Ingredient.create!(name: "Blanc vermouth")
elderflower_liq   = Ingredient.create!(name: "St-Germain elderflower liqueur")
cointreau         = Ingredient.create!(name: "Cointreau")
triple_sec        = Ingredient.create!(name: "Triple sec")
maraschino_liq    = Ingredient.create!(name: "Maraschino liqueur")
green_chartreuse  = Ingredient.create!(name: "Green Chartreuse")
yellow_chartreuse = Ingredient.create!(name: "Yellow Chartreuse")
creme_de_violette = Ingredient.create!(name: "Crème de violette")
falernum          = Ingredient.create!(name: "Falernum")
orgeat            = Ingredient.create!(name: "Orgeat")
passion_fruit_liq = Ingredient.create!(name: "Passion fruit liqueur")
kahlua            = Ingredient.create!(name: "Kahlúa coffee liqueur")
cynar             = Ingredient.create!(name: "Cynar")

# Fresh citrus & juices
lemon_juice       = Ingredient.create!(name: "Fresh lemon juice")
lime_juice        = Ingredient.create!(name: "Fresh lime juice")
grapefruit_juice  = Ingredient.create!(name: "Fresh grapefruit juice")
orange_juice      = Ingredient.create!(name: "Fresh orange juice")
pineapple_juice   = Ingredient.create!(name: "Pineapple juice")
passion_juice     = Ingredient.create!(name: "Passion fruit puree")

# Syrups
simple_syrup      = Ingredient.create!(name: "Simple syrup (1:1)")
rich_demerara     = Ingredient.create!(name: "Rich demerara syrup (2:1)")
honey_syrup       = Ingredient.create!(name: "Honey syrup (3:1)")
grenadine         = Ingredient.create!(name: "Grenadine")
raspberry_syrup   = Ingredient.create!(name: "Raspberry syrup")
ginger_syrup      = Ingredient.create!(name: "Ginger syrup")
cinnamon_syrup    = Ingredient.create!(name: "Cinnamon syrup")
vanilla_syrup     = Ingredient.create!(name: "Vanilla syrup")
agave_syrup       = Ingredient.create!(name: "Agave syrup")

# Bitters
angostura_bitters  = Ingredient.create!(name: "Angostura bitters")
orange_bitters     = Ingredient.create!(name: "Orange bitters")
peychauds_bitters  = Ingredient.create!(name: "Peychaud's bitters")
mole_bitters       = Ingredient.create!(name: "Mole bitters")
grapefruit_bitters = Ingredient.create!(name: "Grapefruit bitters")

# Mixers & sodas
ginger_beer        = Ingredient.create!(name: "Ginger beer")
ginger_ale         = Ingredient.create!(name: "Ginger ale")
club_soda          = Ingredient.create!(name: "Club soda")
prosecco           = Ingredient.create!(name: "Prosecco")
champagne          = Ingredient.create!(name: "Champagne")
tonic_water        = Ingredient.create!(name: "Tonic water")
cold_brew_coffee   = Ingredient.create!(name: "Cold brew concentrate")
coconut_cream      = Ingredient.create!(name: "Coconut cream")

# Misc / garnishes / modifiers
egg_white          = Ingredient.create!(name: "Egg white")
heavy_cream        = Ingredient.create!(name: "Heavy cream")
salt_rim           = Ingredient.create!(name: "Kosher salt (rim)")
sugar_rim          = Ingredient.create!(name: "Superfine sugar (rim)")
lemon_twist        = Ingredient.create!(name: "Lemon twist (garnish)")
orange_twist       = Ingredient.create!(name: "Orange twist (garnish)")
lime_wheel         = Ingredient.create!(name: "Lime wheel (garnish)")
maraschino_cherry  = Ingredient.create!(name: "Luxardo maraschino cherry")
mint_sprig         = Ingredient.create!(name: "Fresh mint sprig")
islay_float        = Ingredient.create!(name: "Islay single malt Scotch (float)")

puts "Created #{Ingredient.count} ingredients."

# ============================================================
# COCKTAIL RECIPES
# ============================================================
puts "Creating cocktail recipes..."

# ------------------------------------
# 1. Old Fashioned
# ------------------------------------
old_fashioned = CocktailRecipe.create!(
  user: u1,
  category: cat_whiskey,
  title: "Old Fashioned",
  description: "The Old Fashioned is the original cocktail — a disciplined marriage of spirit, sugar, water, and bitters that dates to the early 19th century. When made right with a quality bourbon or rye, it's arguably the greatest drink ever conceived. The key is balance: enough sweetness to integrate, enough bitters to add complexity, and good ice to dilute slowly. Use Knob Creek, Elijah Craig, or Rittenhouse Rye for best results.",
  directions: "1. Add rich demerara syrup to a rocks glass.\n2. Add 2 dashes Angostura bitters and 1 dash orange bitters.\n3. Add a large ice cube or sphere.\n4. Pour 2 oz bourbon over the ice.\n5. Stir gently for 20–25 seconds to chill and dilute.\n6. Express an orange twist over the glass, rubbing the oils around the rim.\n7. Drop the twist into the glass.\n8. Optional: add one Luxardo cherry."
)
RecipeIngredient.create!(cocktail_recipe: old_fashioned, ingredient: bourbon,           quantity: "2 oz")
RecipeIngredient.create!(cocktail_recipe: old_fashioned, ingredient: rich_demerara,     quantity: "¼ oz")
RecipeIngredient.create!(cocktail_recipe: old_fashioned, ingredient: angostura_bitters, quantity: "2 dashes")
RecipeIngredient.create!(cocktail_recipe: old_fashioned, ingredient: orange_bitters,    quantity: "1 dash")
RecipeIngredient.create!(cocktail_recipe: old_fashioned, ingredient: orange_twist,      quantity: "1 piece")
RecipeIngredient.create!(cocktail_recipe: old_fashioned, ingredient: maraschino_cherry, quantity: "1 (optional)")

# ------------------------------------
# 2. Negroni
# ------------------------------------
negroni = CocktailRecipe.create!(
  user: u2,
  category: cat_classic,
  title: "Negroni",
  description: "The Negroni is the perfect aperitivo — bitter, sweet, and boozy in equal measure. Equal parts gin, Campari, and sweet vermouth stirred over ice and served with an orange peel. It was allegedly invented in Florence in 1919 when Count Negroni asked his bartender to strengthen an Americano by swapping the soda water for gin. Use a quality London dry gin and Carpano Antica Formula or Cocchi Torino for the vermouth.",
  directions: "1. Combine London dry gin, Campari, and sweet vermouth in a mixing glass.\n2. Fill the mixing glass with ice.\n3. Stir for 30 seconds — about 50 rotations — until well chilled and properly diluted.\n4. Strain into a rocks glass over a large, clear ice cube.\n5. Express an orange twist over the drink to release the citrus oils.\n6. Rub the twist around the rim of the glass and place it in the drink."
)
RecipeIngredient.create!(cocktail_recipe: negroni, ingredient: london_dry_gin, quantity: "1 oz")
RecipeIngredient.create!(cocktail_recipe: negroni, ingredient: campari,        quantity: "1 oz")
RecipeIngredient.create!(cocktail_recipe: negroni, ingredient: sweet_vermouth, quantity: "1 oz")
RecipeIngredient.create!(cocktail_recipe: negroni, ingredient: orange_twist,   quantity: "1 piece")

# ------------------------------------
# 3. Classic Daiquiri
# ------------------------------------
daiquiri = CocktailRecipe.create!(
  user: u3,
  category: cat_rum,
  title: "Classic Daiquiri",
  description: "The Daiquiri is one of the most perfect and misunderstood cocktails in existence. Far from the blended, sugary resort drinks, a proper Daiquiri is a crisp, balanced shaken cocktail of rum, fresh lime, and a touch of sugar. The secret is using fresh-squeezed lime juice — never bottled — and a quality white rum with some character, like Plantation 3 Stars or Flor de Caña 4yr. Double-strain for a silky, clean texture.",
  directions: "1. Chill a coupe glass in the freezer or with ice water.\n2. Combine white rum, fresh lime juice, and simple syrup in a cocktail shaker.\n3. Fill the shaker two-thirds full with ice.\n4. Shake vigorously for 12–15 seconds.\n5. Double-strain through both a Hawthorne strainer and a fine mesh strainer into the chilled coupe.\n6. No garnish — the clarity and color of the drink is the presentation."
)
RecipeIngredient.create!(cocktail_recipe: daiquiri, ingredient: white_rum,    quantity: "2 oz")
RecipeIngredient.create!(cocktail_recipe: daiquiri, ingredient: lime_juice,   quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: daiquiri, ingredient: simple_syrup, quantity: "¾ oz")

# ------------------------------------
# 4. Classic Margarita
# ------------------------------------
margarita = CocktailRecipe.create!(
  user: u4,
  category: cat_tequila,
  title: "Classic Margarita",
  description: "A properly made Margarita is tart, refreshing, and showcases quality tequila rather than masking it. The golden ratio is 2:1:1 — tequila, lime, triple sec. Use blanco tequila for brightness and Cointreau instead of cheap triple sec. Fresh lime juice is non-negotiable. A salt rim amplifies the citrus and contrasts the sweet-sour balance beautifully. Served on the rocks or up — both are correct.",
  directions: "1. Run a lime wedge around half the edge of a rocks glass and dip in kosher salt. Set aside.\n2. Combine blanco tequila, fresh lime juice, and Cointreau in a cocktail shaker.\n3. Fill with ice and shake hard for 12–15 seconds.\n4. Fill the rimmed rocks glass with fresh ice.\n5. Strain the cocktail over the ice.\n6. Garnish with a lime wheel on the rim."
)
RecipeIngredient.create!(cocktail_recipe: margarita, ingredient: blanco_tequila, quantity: "2 oz")
RecipeIngredient.create!(cocktail_recipe: margarita, ingredient: lime_juice,     quantity: "1 oz")
RecipeIngredient.create!(cocktail_recipe: margarita, ingredient: cointreau,      quantity: "1 oz")
RecipeIngredient.create!(cocktail_recipe: margarita, ingredient: salt_rim,       quantity: "to coat half rim")
RecipeIngredient.create!(cocktail_recipe: margarita, ingredient: lime_wheel,     quantity: "1 piece")

# ------------------------------------
# 5. Moscow Mule
# ------------------------------------
moscow_mule = CocktailRecipe.create!(
  user: u5,
  category: cat_vodka,
  title: "Moscow Mule",
  description: "The Moscow Mule was invented in 1941 at the Cock 'n' Bull bar in Hollywood, born of a happy collision between a vodka importer and a ginger beer producer. Traditionally served in a copper mug (which keeps it ice cold), it's one of the most refreshing highballs in the cocktail canon. Use a spicy, full-flavored ginger beer — Fever-Tree Spiced or Bundaberg — not ginger ale, and never flat ginger beer.",
  directions: "1. Fill a copper mug (or highball glass) with crushed ice.\n2. Pour the vodka over the ice.\n3. Squeeze the juice of half a lime directly into the mug and drop the spent lime half in.\n4. Top with cold ginger beer. Do not stir aggressively — let it mix gently as you pour.\n5. Garnish with a fresh mint sprig. Slap the sprig in your palm once before adding to release the aromatic oils."
)
RecipeIngredient.create!(cocktail_recipe: moscow_mule, ingredient: vodka,       quantity: "2 oz")
RecipeIngredient.create!(cocktail_recipe: moscow_mule, ingredient: lime_juice,  quantity: "½ oz")
RecipeIngredient.create!(cocktail_recipe: moscow_mule, ingredient: ginger_beer, quantity: "4–5 oz")
RecipeIngredient.create!(cocktail_recipe: moscow_mule, ingredient: mint_sprig,  quantity: "1 sprig")

# ------------------------------------
# 6. Dark & Stormy
# ------------------------------------
dark_stormy = CocktailRecipe.create!(
  user: u6,
  category: cat_rum,
  title: "Dark & Stormy",
  description: "The Dark & Stormy is Bermuda's national cocktail and a registered trademark of Gosling's Black Seal rum — which means technically only Gosling's can be called a Dark & Stormy. The combination of dark, molasses-forward rum floated over spicy ginger beer with a squeeze of lime is deeply satisfying. Don't stir the float — watch the dark rum cascade through the ginger beer as you drink it.",
  directions: "1. Fill a highball glass with ice.\n2. Add the fresh lime juice over the ice.\n3. Pour in the ginger beer until the glass is about three-quarters full.\n4. Slowly pour the dark rum over the back of a bar spoon held just at the surface of the liquid to float it on top.\n5. Garnish with a lime wheel pressed onto the rim.\n6. Give it one gentle stir at the table before the first sip."
)
RecipeIngredient.create!(cocktail_recipe: dark_stormy, ingredient: dark_rum,    quantity: "2 oz")
RecipeIngredient.create!(cocktail_recipe: dark_stormy, ingredient: ginger_beer, quantity: "4 oz")
RecipeIngredient.create!(cocktail_recipe: dark_stormy, ingredient: lime_juice,  quantity: "½ oz")
RecipeIngredient.create!(cocktail_recipe: dark_stormy, ingredient: lime_wheel,  quantity: "1 piece")

# ------------------------------------
# 7. Whiskey Sour (with egg white)
# ------------------------------------
whiskey_sour = CocktailRecipe.create!(
  user: u7,
  category: cat_whiskey,
  title: "Whiskey Sour",
  description: "The Whiskey Sour is one of the great sour cocktails, and adding an egg white transforms it into something exceptional — the foam provides a silky, luscious mouthfeel that softens the citrus edge and makes every sip feel complete. Use bourbon for a sweeter, fuller profile, or rye for a drier, spicier result. The dry shake technique (without ice first) is essential for building proper foam. Angostura bitters on the foam is traditional.",
  directions: "1. Combine bourbon, fresh lemon juice, simple syrup, and egg white in a cocktail shaker.\n2. Dry shake (without ice) vigorously for 15 seconds to emulsify the egg white and build foam.\n3. Add ice and shake hard again for another 15 seconds.\n4. Double-strain into a chilled rocks glass over a large ice cube, or into a chilled coupe for an up presentation.\n5. Add 3–4 dashes Angostura bitters on top of the foam in a line. Drag a toothpick through to create a feather pattern.\n6. Garnish with a Luxardo maraschino cherry on a pick."
)
RecipeIngredient.create!(cocktail_recipe: whiskey_sour, ingredient: bourbon,           quantity: "2 oz")
RecipeIngredient.create!(cocktail_recipe: whiskey_sour, ingredient: lemon_juice,       quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: whiskey_sour, ingredient: simple_syrup,      quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: whiskey_sour, ingredient: egg_white,         quantity: "1 (about ¾ oz)")
RecipeIngredient.create!(cocktail_recipe: whiskey_sour, ingredient: angostura_bitters, quantity: "3 dashes (on foam)")
RecipeIngredient.create!(cocktail_recipe: whiskey_sour, ingredient: maraschino_cherry, quantity: "1")

# ------------------------------------
# 8. Aperol Spritz
# ------------------------------------
aperol_spritz = CocktailRecipe.create!(
  user: u8,
  category: cat_aperitivo,
  title: "Aperol Spritz",
  description: "Italy's unofficial national aperitivo hour cocktail — low-ABV, bittersweet, and endlessly refreshing. The classic ratio is 3-2-1: three parts prosecco, two parts Aperol, one part soda. Always build in the glass over ice so the bubbles integrate naturally without being overstirred. A good orange slice is essential — it contributes flavor as you drink, not just aesthetics.",
  directions: "1. Fill a large wine glass with plenty of ice cubes.\n2. Pour in the prosecco first — the bubbles help carry the Aperol throughout the drink.\n3. Add the Aperol.\n4. Add a splash of club soda.\n5. Give it one gentle stir — maximum one rotation so you don't lose carbonation.\n6. Garnish with a generous thick slice of orange, placed inside the glass."
)
RecipeIngredient.create!(cocktail_recipe: aperol_spritz, ingredient: aperol,    quantity: "2 oz")
RecipeIngredient.create!(cocktail_recipe: aperol_spritz, ingredient: prosecco,  quantity: "3 oz")
RecipeIngredient.create!(cocktail_recipe: aperol_spritz, ingredient: club_soda, quantity: "1 oz")

# ------------------------------------
# 9. Paloma
# ------------------------------------
paloma = CocktailRecipe.create!(
  user: u1,
  category: cat_tequila,
  title: "Paloma",
  description: "The Paloma is Mexico's most popular tequila cocktail — more beloved in its home country than the Margarita. This is a fresh-juice version rather than the Squirt-soda original. Blanco tequila, fresh grapefruit juice, a touch of lime, a pinch of salt, and a splash of soda over ice. The salt does incredible things here — it suppresses bitterness in the grapefruit and amplifies the sweet-tart balance. A Tajín salt rim is a fantastic upgrade.",
  directions: "1. Wet the rim of a highball glass and dip in Tajín mixed with kosher salt.\n2. Fill the glass with ice.\n3. Add blanco tequila, fresh grapefruit juice, lime juice, and agave syrup directly over the ice.\n4. Add a pinch of sea salt and stir briefly to combine.\n5. Top with a splash of club soda.\n6. Garnish with a half-wheel of grapefruit on the rim."
)
RecipeIngredient.create!(cocktail_recipe: paloma, ingredient: blanco_tequila,   quantity: "2 oz")
RecipeIngredient.create!(cocktail_recipe: paloma, ingredient: grapefruit_juice, quantity: "2 oz")
RecipeIngredient.create!(cocktail_recipe: paloma, ingredient: lime_juice,       quantity: "½ oz")
RecipeIngredient.create!(cocktail_recipe: paloma, ingredient: agave_syrup,      quantity: "¼ oz")
RecipeIngredient.create!(cocktail_recipe: paloma, ingredient: club_soda,        quantity: "1 oz")
RecipeIngredient.create!(cocktail_recipe: paloma, ingredient: salt_rim,         quantity: "Tajín + salt, half rim")

# ------------------------------------
# 10. Bee's Knees
# ------------------------------------
bees_knees = CocktailRecipe.create!(
  user: u2,
  category: cat_gin,
  title: "Bee's Knees",
  description: "The Bee's Knees is a Prohibition-era gin sour that used honey and citrus to mask the rough edges of bathtub gin. Today, with quality London dry gin available, it's a revelation — bright, floral, and perfectly balanced. The honey syrup is the key: make it 3:1 honey to hot water so it's thick and rich. It integrates beautifully with the botanicals of the gin. A classic that deserves far more attention in modern bar programs.",
  directions: "1. Make honey syrup: combine 3 parts raw honey with 1 part hot water; stir until fully dissolved; cool completely.\n2. Chill a coupe glass in the freezer or with ice water.\n3. Combine London dry gin, fresh lemon juice, and honey syrup in a cocktail shaker.\n4. Fill with ice and shake vigorously for 12–15 seconds.\n5. Double-strain into the chilled coupe.\n6. Express the oils from a lemon twist over the surface and set it on the rim."
)
RecipeIngredient.create!(cocktail_recipe: bees_knees, ingredient: london_dry_gin, quantity: "2 oz")
RecipeIngredient.create!(cocktail_recipe: bees_knees, ingredient: lemon_juice,    quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: bees_knees, ingredient: honey_syrup,    quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: bees_knees, ingredient: lemon_twist,    quantity: "1 piece")

# ------------------------------------
# 11. Paper Plane
# ------------------------------------
paper_plane = CocktailRecipe.create!(
  user: u3,
  category: cat_classic,
  title: "Paper Plane",
  description: "Invented by Sam Ross at Milk & Honey in New York City around 2007, the Paper Plane is a modern classic built entirely on equal parts — bourbon, Aperol, Amaro Nonino, and fresh lemon juice. It sounds like it shouldn't work, but the interplay between the sweetness of bourbon, the bitter orange of Aperol, the herbal complexity of Nonino, and the citrus lift of lemon is absolutely masterful. Use Bulleit or Wild Turkey 101.",
  directions: "1. Chill a coupe glass in the freezer.\n2. Measure equal parts of all four ingredients — ¾ oz each — into a cocktail shaker.\n3. Fill with ice and shake hard for 12–15 seconds.\n4. Double-strain into the chilled coupe.\n5. No garnish — the color is the presentation. The drink should be a gorgeous sunset amber-orange."
)
RecipeIngredient.create!(cocktail_recipe: paper_plane, ingredient: bourbon,      quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: paper_plane, ingredient: aperol,       quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: paper_plane, ingredient: amaro_nonino, quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: paper_plane, ingredient: lemon_juice,  quantity: "¾ oz")

# ------------------------------------
# 12. The Last Word
# ------------------------------------
last_word = CocktailRecipe.create!(
  user: u4,
  category: cat_gin,
  title: "The Last Word",
  description: "The Last Word dates to the 1920s at the Detroit Athletic Club and was rescued from obscurity by Ted Saucier in his 1951 book 'Bottoms Up.' It's an equal-parts cocktail — gin, Green Chartreuse, Luxardo maraschino liqueur, and fresh lime juice — and possibly the most complex drink ever to emerge from such a simple formula. The Chartreuse brings an overwhelming burst of alpine herbs, balanced by the cherry sweetness of maraschino and the brightness of lime.",
  directions: "1. Chill a coupe glass.\n2. Combine London dry gin, Green Chartreuse, Luxardo maraschino liqueur, and fresh lime juice in equal parts (¾ oz each) in a shaker.\n3. Fill with ice and shake vigorously for 12–15 seconds.\n4. Double-strain into the chilled coupe.\n5. Garnish with a single Luxardo cherry on a pick balanced on the rim."
)
RecipeIngredient.create!(cocktail_recipe: last_word, ingredient: london_dry_gin,    quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: last_word, ingredient: green_chartreuse,  quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: last_word, ingredient: maraschino_liq,    quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: last_word, ingredient: lime_juice,        quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: last_word, ingredient: maraschino_cherry, quantity: "1 (garnish)")

# ------------------------------------
# 13. Penicillin
# ------------------------------------
penicillin = CocktailRecipe.create!(
  user: u5,
  category: cat_whiskey,
  title: "Penicillin",
  description: "Sam Ross created the Penicillin at Milk & Honey in 2005 and it has since become one of the most influential modern cocktails in the world. Blended Scotch provides the base, fresh lemon and honey-ginger syrup create the sour backbone, and a float of peaty Islay single malt delivers a smoky, medicinal nose on every sip. Make the ginger-honey syrup fresh: 3:1 honey to water, steeped with fresh ginger slices for 15 minutes.",
  directions: "1. Make ginger-honey syrup: combine 3 parts honey, 1 part water, and a thumb of fresh sliced ginger. Heat gently, steep 15 minutes, strain, cool.\n2. Combine blended Scotch, fresh lemon juice, and ginger-honey syrup in a shaker.\n3. Fill with ice and shake for 12–15 seconds.\n4. Double-strain into a rocks glass over a large ice cube.\n5. Float ¼ oz of Islay Scotch (Laphroaig Quarter Cask or Caol Ila 12yr) over the back of a spoon on top.\n6. Garnish with a piece of candied ginger on a pick."
)
RecipeIngredient.create!(cocktail_recipe: penicillin, ingredient: scotch,          quantity: "2 oz")
RecipeIngredient.create!(cocktail_recipe: penicillin, ingredient: lemon_juice,     quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: penicillin, ingredient: honey_syrup,     quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: penicillin, ingredient: ginger_syrup,    quantity: "¼ oz")
RecipeIngredient.create!(cocktail_recipe: penicillin, ingredient: islay_float,     quantity: "¼ oz (float)")

# ------------------------------------
# 14. French 75
# ------------------------------------
french_75 = CocktailRecipe.create!(
  user: u6,
  category: cat_champagne,
  title: "French 75",
  description: "Named after the 75mm field gun used by the French army in WWI — the drink's kick supposedly had a similar impact. A proper French 75 is gin-based (not cognac, despite common menu confusion), shaken with lemon and simple syrup, then topped with Champagne in a flute. It's elegant, celebratory, and dangerously easy to drink. A floral gin like Tanqueray No. Ten or Hendrick's works beautifully here.",
  directions: "1. Chill a Champagne flute in the freezer.\n2. Combine London dry gin, fresh lemon juice, and simple syrup in a cocktail shaker with ice.\n3. Shake vigorously for 12 seconds.\n4. Fine-strain into the chilled flute.\n5. Top gently with cold Champagne — pour slowly down the side of the glass to preserve bubbles.\n6. Express a long lemon twist over the drink, coil it, and set it inside the glass."
)
RecipeIngredient.create!(cocktail_recipe: french_75, ingredient: london_dry_gin, quantity: "1½ oz")
RecipeIngredient.create!(cocktail_recipe: french_75, ingredient: lemon_juice,    quantity: "½ oz")
RecipeIngredient.create!(cocktail_recipe: french_75, ingredient: simple_syrup,   quantity: "½ oz")
RecipeIngredient.create!(cocktail_recipe: french_75, ingredient: champagne,      quantity: "2–3 oz (top)")
RecipeIngredient.create!(cocktail_recipe: french_75, ingredient: lemon_twist,    quantity: "1 long twist")

# ------------------------------------
# 15. Espresso Martini
# ------------------------------------
espresso_martini = CocktailRecipe.create!(
  user: u7,
  category: cat_vodka,
  title: "Espresso Martini",
  description: "Invented by Dick Bradsell at Soho Brasserie in London in 1983 — allegedly for a famous model who asked for something to 'wake me up and then f*** me up.' The cocktail requires freshly pulled espresso (not cold brew alone) and quality Kahlúa. The three coffee beans on top represent health, wealth, and happiness — a time-honored tradition. Shake extremely hard: the vigorous agitation with fresh espresso creates the signature crema foam.",
  directions: "1. Pull a fresh shot of espresso and allow it to cool for 2–3 minutes — still warm is fine.\n2. Combine vodka, Kahlúa, cold brew concentrate, and the espresso in a cocktail shaker.\n3. Fill the shaker completely with ice and shake VERY hard for 15–20 seconds.\n4. Double-strain into a chilled cocktail glass.\n5. Garnish with three espresso beans arranged in the center of the foam.\n6. Serve immediately before the foam settles."
)
RecipeIngredient.create!(cocktail_recipe: espresso_martini, ingredient: vodka,           quantity: "1½ oz")
RecipeIngredient.create!(cocktail_recipe: espresso_martini, ingredient: kahlua,          quantity: "1 oz")
RecipeIngredient.create!(cocktail_recipe: espresso_martini, ingredient: cold_brew_coffee, quantity: "1 oz (fresh espresso)")
RecipeIngredient.create!(cocktail_recipe: espresso_martini, ingredient: simple_syrup,    quantity: "¼ oz")

# ------------------------------------
# 16. Jungle Bird
# ------------------------------------
jungle_bird = CocktailRecipe.create!(
  user: u8,
  category: cat_tiki,
  title: "Jungle Bird",
  description: "Created in 1978 at the Kuala Lumpur Hilton's Aviary Bar — the only tiki cocktail to feature Campari as a primary ingredient. The bitterness of Campari against pineapple juice and dark rum is one of the most unexpected and brilliant flavor pairings in the cocktail world. Rescued from obscurity by Jeff 'Beachbum' Berry in 2002, it's now a modern classic. Use real fresh pineapple juice when possible — the difference is significant.",
  directions: "1. Combine aged rum, Campari, fresh pineapple juice, fresh lime juice, and rich demerara syrup in a cocktail shaker.\n2. Fill with ice and shake hard for 15 seconds.\n3. Strain into a double rocks glass or tiki mug over crushed ice.\n4. Garnish with a pineapple wedge and a Luxardo cherry on a pick.\n5. Add a paper straw and paper umbrella — tiki protocol demands both."
)
RecipeIngredient.create!(cocktail_recipe: jungle_bird, ingredient: aged_rum,        quantity: "1½ oz")
RecipeIngredient.create!(cocktail_recipe: jungle_bird, ingredient: campari,         quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: jungle_bird, ingredient: pineapple_juice, quantity: "1½ oz")
RecipeIngredient.create!(cocktail_recipe: jungle_bird, ingredient: lime_juice,      quantity: "½ oz")
RecipeIngredient.create!(cocktail_recipe: jungle_bird, ingredient: rich_demerara,   quantity: "½ oz")

# ------------------------------------
# 17. Porn Star Martini
# ------------------------------------
porn_star_martini = CocktailRecipe.create!(
  user: u1,
  category: cat_vodka,
  title: "Porn Star Martini",
  description: "Created by Douglas Ankrah at the Townhouse Bar in London in 2002, the Porn Star Martini is playful, tropical, and undeniably delicious. Vodka, passion fruit liqueur, fresh passion fruit puree, a touch of vanilla, with a separate shot of Champagne served alongside. The Champagne is functional — sip it between sips of the main drink to cleanse the palate and amplify the tropical sweetness. Use a clean, neutral vodka so the passion fruit can shine.",
  directions: "1. Chill a coupe glass.\n2. Combine vodka, passion fruit liqueur, passion fruit puree, vanilla syrup, and fresh lime juice in a shaker.\n3. Fill with ice and shake hard for 15 seconds.\n4. Double-strain into the chilled coupe.\n5. Float half a fresh passion fruit (scooped side up) on top of the drink.\n6. Pour 1 oz of chilled Champagne or Prosecco into a shot glass and serve alongside."
)
RecipeIngredient.create!(cocktail_recipe: porn_star_martini, ingredient: vodka,            quantity: "1½ oz")
RecipeIngredient.create!(cocktail_recipe: porn_star_martini, ingredient: passion_fruit_liq, quantity: "1 oz")
RecipeIngredient.create!(cocktail_recipe: porn_star_martini, ingredient: passion_juice,    quantity: "1 oz")
RecipeIngredient.create!(cocktail_recipe: porn_star_martini, ingredient: vanilla_syrup,    quantity: "¼ oz")
RecipeIngredient.create!(cocktail_recipe: porn_star_martini, ingredient: lime_juice,       quantity: "¼ oz")
RecipeIngredient.create!(cocktail_recipe: porn_star_martini, ingredient: champagne,        quantity: "1 oz (on the side)")

# ------------------------------------
# 18. Clover Club
# ------------------------------------
clover_club = CocktailRecipe.create!(
  user: u2,
  category: cat_gin,
  title: "Clover Club",
  description: "The Clover Club predates Prohibition, originating at the Bellevue-Stratford Hotel in Philadelphia around 1910. It's a gorgeous, delicate cocktail: London dry gin, fresh lemon juice, raspberry syrup, and egg white. The foam is dense and pink, and the flavor is bright, fruity, and incredibly elegant. Make your own raspberry syrup with fresh or freeze-dried raspberries for the most vibrant flavor. Dry shake the egg white first — no shortcuts.",
  directions: "1. Chill a coupe glass.\n2. Combine London dry gin, fresh lemon juice, raspberry syrup, and egg white in a shaker without ice.\n3. Dry shake vigorously for 15 seconds to emulsify the egg white.\n4. Add ice and shake hard for another 15 seconds.\n5. Double-strain into the chilled coupe — push through both strainers to achieve a tight, smooth foam.\n6. Garnish with 3 fresh raspberries dropped gently onto the foam."
)
RecipeIngredient.create!(cocktail_recipe: clover_club, ingredient: london_dry_gin,  quantity: "2 oz")
RecipeIngredient.create!(cocktail_recipe: clover_club, ingredient: lemon_juice,     quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: clover_club, ingredient: raspberry_syrup, quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: clover_club, ingredient: egg_white,       quantity: "1 white")

# ------------------------------------
# 19. Toronto
# ------------------------------------
toronto = CocktailRecipe.create!(
  user: u3,
  category: cat_whiskey,
  title: "Toronto",
  description: "The Toronto is an underappreciated stirred cocktail that predates Prohibition. Rye whiskey and Fernet-Branca is a combination that sounds austere but is deeply, darkly complex — the menthol, herb, and bitterness of Fernet integrates with the spice of rye to create something uniquely satisfying. A quarter ounce of Fernet is the correct amount — enough to add character without dominating. This is a bartender's cocktail.",
  directions: "1. Chill a coupe glass.\n2. Combine rye whiskey, Fernet-Branca, simple syrup, and Angostura bitters in a mixing glass.\n3. Fill the mixing glass with ice.\n4. Stir for 30 seconds — about 50 rotations — until well chilled and properly diluted.\n5. Strain into the chilled coupe.\n6. Express an orange twist over the surface, rub around the rim, then either drop it in or perch it on the edge."
)
RecipeIngredient.create!(cocktail_recipe: toronto, ingredient: rye_whiskey,       quantity: "2 oz")
RecipeIngredient.create!(cocktail_recipe: toronto, ingredient: fernet_branca,     quantity: "¼ oz")
RecipeIngredient.create!(cocktail_recipe: toronto, ingredient: simple_syrup,      quantity: "¼ oz")
RecipeIngredient.create!(cocktail_recipe: toronto, ingredient: angostura_bitters, quantity: "2 dashes")
RecipeIngredient.create!(cocktail_recipe: toronto, ingredient: orange_twist,      quantity: "1 piece")

# ------------------------------------
# 20. Aviation
# ------------------------------------
aviation = CocktailRecipe.create!(
  user: u4,
  category: cat_gin,
  title: "Aviation",
  description: "The Aviation appeared in Hugo Ensslin's 1916 'Recipes for Mixed Drinks' and is one of the great pre-Prohibition gin cocktails. Two unusual liqueurs — maraschino and crème de violette — give it an extraordinary pale lavender-blue color and floral, cherry complexity. For years it was made without the violette (it was hard to find), but Rothman & Winter revived domestic production. The violette is non-negotiable — without it you have a gin sour, not an Aviation.",
  directions: "1. Chill a coupe glass in the freezer.\n2. Combine London dry gin, fresh lemon juice, Luxardo maraschino liqueur, and crème de violette in a cocktail shaker.\n3. Fill with ice and shake vigorously for 12–15 seconds.\n4. Double-strain into the chilled coupe.\n5. Garnish with a Luxardo maraschino cherry on a pick balanced across the rim."
)
RecipeIngredient.create!(cocktail_recipe: aviation, ingredient: london_dry_gin,    quantity: "2 oz")
RecipeIngredient.create!(cocktail_recipe: aviation, ingredient: lemon_juice,       quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: aviation, ingredient: maraschino_liq,    quantity: "½ oz")
RecipeIngredient.create!(cocktail_recipe: aviation, ingredient: creme_de_violette, quantity: "¼ oz")
RecipeIngredient.create!(cocktail_recipe: aviation, ingredient: maraschino_cherry, quantity: "1")

# ------------------------------------
# 21. Oaxacan Negroni
# ------------------------------------
mezcal_negroni = CocktailRecipe.create!(
  user: u5,
  category: cat_tequila,
  title: "Oaxacan Negroni",
  description: "A smoky, contemporary riff on the classic Negroni that swaps London dry gin for mezcal. The agave smokiness of mezcal weaves beautifully with the bitterness of Campari and the rich herbal sweetness of vermouth. Phil Ward at Death & Company popularized the mezcal Negroni riff. Use a quality joven or espadin mezcal — Del Maguey Vida works beautifully without being overpoweringly smoky.",
  directions: "1. Combine mezcal, Campari, and sweet vermouth in a mixing glass.\n2. Fill with ice.\n3. Stir for 30 seconds — about 45–50 rotations — until well chilled.\n4. Strain into a rocks glass over a large, clear ice cube.\n5. Express an orange twist over the drink to release the citrus oils.\n6. Rub the twist around the rim and place it in the glass."
)
RecipeIngredient.create!(cocktail_recipe: mezcal_negroni, ingredient: mezcal,        quantity: "1 oz")
RecipeIngredient.create!(cocktail_recipe: mezcal_negroni, ingredient: campari,       quantity: "1 oz")
RecipeIngredient.create!(cocktail_recipe: mezcal_negroni, ingredient: sweet_vermouth, quantity: "1 oz")
RecipeIngredient.create!(cocktail_recipe: mezcal_negroni, ingredient: orange_twist,  quantity: "1 piece")

# ------------------------------------
# 22. Amaretto Sour (Morgenthaler Method)
# ------------------------------------
amaretto_sour = CocktailRecipe.create!(
  user: u6,
  category: cat_classic,
  title: "Amaretto Sour (Morgenthaler Style)",
  description: "Jeffrey Morgenthaler rehabilitated the maligned Amaretto Sour in 2012 by adding a small amount of cask-strength bourbon and egg white. The bourbon provides dryness and backbone that balances the sweetness of amaretto; the egg white gives it a gorgeous texture and foam. This version uses Amaro Averna as a richer, more complex base. Use Wild Turkey 101 for the bourbon — the high proof holds up.",
  directions: "1. Combine Amaro Averna, cask-strength bourbon, fresh lemon juice, simple syrup, and egg white in a shaker without ice.\n2. Dry shake vigorously for 15 seconds.\n3. Add ice and shake again for 15 seconds.\n4. Double-strain into a chilled rocks glass with a large ice cube.\n5. Add 3–4 dashes Angostura bitters on the foam and drag a toothpick through for a decorative pattern.\n6. Garnish with a Luxardo cherry."
)
RecipeIngredient.create!(cocktail_recipe: amaretto_sour, ingredient: amaro_averna,     quantity: "1½ oz")
RecipeIngredient.create!(cocktail_recipe: amaretto_sour, ingredient: bourbon,          quantity: "¾ oz (cask strength)")
RecipeIngredient.create!(cocktail_recipe: amaretto_sour, ingredient: lemon_juice,      quantity: "1 oz")
RecipeIngredient.create!(cocktail_recipe: amaretto_sour, ingredient: simple_syrup,     quantity: "1 tsp")
RecipeIngredient.create!(cocktail_recipe: amaretto_sour, ingredient: egg_white,        quantity: "1 white")
RecipeIngredient.create!(cocktail_recipe: amaretto_sour, ingredient: angostura_bitters, quantity: "3–4 dashes (foam)")
RecipeIngredient.create!(cocktail_recipe: amaretto_sour, ingredient: maraschino_cherry, quantity: "1")

# ------------------------------------
# 23. Sazerac
# ------------------------------------
sazerac = CocktailRecipe.create!(
  user: u7,
  category: cat_whiskey,
  title: "Sazerac",
  description: "The Sazerac is New Orleans in a glass — one of the oldest known cocktails in America, dating to the 1800s. Rye whiskey, Peychaud's bitters, a rinse of absinthe, and a lemon peel that is expressed but never dropped into the drink. The Peychaud's gives it its distinctive rosy color and anise-cherry flavor. Use Sazerac Rye or Rittenhouse Bottled-in-Bond. The absinthe rinse is everything — don't skip it and don't substitute pastis.",
  directions: "1. Chill a rocks glass in the freezer.\n2. In a separate mixing glass, combine rich demerara syrup and Peychaud's bitters. Add rye whiskey and fill with ice. Stir for 30 seconds.\n3. Remove the rocks glass from the freezer. Add a rinse of absinthe (about ¼ oz), swirl to coat the glass, and discard the excess.\n4. Strain the rye mixture into the absinthe-rinsed glass — no ice, served neat.\n5. Express a long lemon twist over the surface to release the oils, rub around the rim, then DISCARD the twist — it does not go in the glass."
)
RecipeIngredient.create!(cocktail_recipe: sazerac, ingredient: rye_whiskey,       quantity: "2 oz")
RecipeIngredient.create!(cocktail_recipe: sazerac, ingredient: peychauds_bitters, quantity: "3 dashes")
RecipeIngredient.create!(cocktail_recipe: sazerac, ingredient: angostura_bitters, quantity: "1 dash")
RecipeIngredient.create!(cocktail_recipe: sazerac, ingredient: rich_demerara,     quantity: "¼ oz")
RecipeIngredient.create!(cocktail_recipe: sazerac, ingredient: lemon_twist,       quantity: "1 (express and discard)")

# ------------------------------------
# 24. Mai Tai (Trader Vic's Original)
# ------------------------------------
mai_tai = CocktailRecipe.create!(
  user: u8,
  category: cat_tiki,
  title: "Mai Tai (Trader Vic's Original)",
  description: "Victor 'Trader Vic' Bergeron created the Mai Tai in 1944 using a 17-year-old J. Wray & Nephew rum. His recipe was simple: rum, lime, orgeat, orange curaçao — 'Out of this world!' The name means 'out of this world' in Tahitian. Today's version splits the rum base between aged rum and overproof Jamaican for depth and funk. Orgeat is the soul of this cocktail — use Small Hand Foods or Liber & Co, not the almond-extract-heavy commercial versions.",
  directions: "1. Combine aged rum, overproof Jamaican rum, fresh lime juice, orgeat, and orange triple sec in a shaker.\n2. Fill with crushed ice and shake briefly — 8–10 seconds.\n3. Pour everything (ice and all) into a double rocks glass or tiki mug.\n4. Top with more crushed ice to form a mound.\n5. Garnish with an inverted spent lime shell, a mint sprig bouquet pushed in near the straw, and a cocktail umbrella.\n6. Serve with a short straw."
)
RecipeIngredient.create!(cocktail_recipe: mai_tai, ingredient: aged_rum,      quantity: "1 oz")
RecipeIngredient.create!(cocktail_recipe: mai_tai, ingredient: overproof_rum, quantity: "1 oz")
RecipeIngredient.create!(cocktail_recipe: mai_tai, ingredient: lime_juice,    quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: mai_tai, ingredient: orgeat,        quantity: "½ oz")
RecipeIngredient.create!(cocktail_recipe: mai_tai, ingredient: triple_sec,    quantity: "½ oz")
RecipeIngredient.create!(cocktail_recipe: mai_tai, ingredient: mint_sprig,    quantity: "1 bouquet")

# ------------------------------------
# 25. Vieux Carré
# ------------------------------------
vieux_carre = CocktailRecipe.create!(
  user: u1,
  category: cat_classic,
  title: "Vieux Carré",
  description: "The Vieux Carré ('old square' — French for the French Quarter) was created by Walter Bergeron at the Hotel Monteleone in New Orleans in the 1930s. It's a masterclass in complexity: rye whiskey and cognac provide a double-spirit base, sweet vermouth adds body, Bénédictine (or Fernet in this version) adds herbal depth, and both Peychaud's and Angostura bitters tie everything together. It's like an Old Fashioned, a Manhattan, and a Sazerac had a sophisticated, worldly child.",
  directions: "1. Combine rye whiskey, cognac, sweet vermouth, Fernet-Branca, Peychaud's bitters, and Angostura bitters in a mixing glass.\n2. Fill the mixing glass with ice.\n3. Stir for 30 seconds.\n4. Strain into a rocks glass over a large ice cube.\n5. Garnish with both a lemon twist and an orange twist, expressed over the drink and placed inside."
)
RecipeIngredient.create!(cocktail_recipe: vieux_carre, ingredient: rye_whiskey,       quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: vieux_carre, ingredient: cognac,            quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: vieux_carre, ingredient: sweet_vermouth,    quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: vieux_carre, ingredient: fernet_branca,     quantity: "1 tsp")
RecipeIngredient.create!(cocktail_recipe: vieux_carre, ingredient: peychauds_bitters, quantity: "2 dashes")
RecipeIngredient.create!(cocktail_recipe: vieux_carre, ingredient: angostura_bitters, quantity: "2 dashes")

# ------------------------------------
# 26. Gimlet
# ------------------------------------
gimlet = CocktailRecipe.create!(
  user: u2,
  category: cat_gin,
  title: "Gimlet",
  description: "The Gimlet was originally made with Rose's Lime Cordial — a preserved, sweetened lime juice — and served to British sailors to prevent scurvy. The fresh-juice version is an entirely different and superior drink. London dry gin and fresh lime juice with a touch of simple syrup, shaken and strained. Crisp, clean, and bracingly tart. Some bartenders do a 50/50 split of fresh lime and Rose's for a nod to the original while keeping some brightness.",
  directions: "1. Chill a coupe glass in the freezer.\n2. Combine London dry gin, fresh lime juice, and simple syrup in a cocktail shaker.\n3. Fill with ice and shake vigorously for 12–15 seconds.\n4. Double-strain into the chilled coupe.\n5. Garnish with a thin lime wheel placed inside the glass, or a lime twist on the rim."
)
RecipeIngredient.create!(cocktail_recipe: gimlet, ingredient: london_dry_gin, quantity: "2 oz")
RecipeIngredient.create!(cocktail_recipe: gimlet, ingredient: lime_juice,     quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: gimlet, ingredient: simple_syrup,   quantity: "½ oz")
RecipeIngredient.create!(cocktail_recipe: gimlet, ingredient: lime_wheel,     quantity: "1 piece")

# ------------------------------------
# 27. Naked & Famous
# ------------------------------------
naked_famous = CocktailRecipe.create!(
  user: u3,
  category: cat_tequila,
  title: "Naked & Famous",
  description: "Joaquín Simó created the Naked & Famous at Death & Company in 2011. Like the Paper Plane, it's built on the elegant equal-parts formula. Mezcal provides smokiness, Aperol brings bitterness and orange sweetness, Yellow Chartreuse adds herbal complexity, and lime juice keeps everything bright. It's the smoky, agave-forward answer to the Paper Plane. The combination is remarkable — better than the sum of its parts.",
  directions: "1. Chill a coupe glass.\n2. Combine mezcal, Aperol, Yellow Chartreuse, and fresh lime juice in equal parts (¾ oz each) in a cocktail shaker.\n3. Fill with ice and shake hard for 12–15 seconds.\n4. Double-strain into the chilled coupe.\n5. No garnish needed — serve immediately. The hazy amber-green color is the presentation."
)
RecipeIngredient.create!(cocktail_recipe: naked_famous, ingredient: mezcal,           quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: naked_famous, ingredient: aperol,           quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: naked_famous, ingredient: yellow_chartreuse, quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: naked_famous, ingredient: lime_juice,       quantity: "¾ oz")

# ------------------------------------
# 28. Spritz Veneziano
# ------------------------------------
spritz_veneziano = CocktailRecipe.create!(
  user: u4,
  category: cat_champagne,
  title: "Spritz Veneziano",
  description: "Before Aperol became the global default, Venetians made their spritz with white wine and a splash of seltzer. This version uses blanc vermouth alongside Aperol for a more herbaceous, complex result than a straight Aperol Spritz. The cassis version from Burgundy is a completely different drink — this is the original Venetian aperitivo. Serve with an olive on the side — the savory contrast is part of the Venetian tradition.",
  directions: "1. Fill a large red wine glass or balloon glass with ice cubes.\n2. Pour the blanc vermouth over the ice.\n3. Add the Aperol.\n4. Top with chilled Prosecco.\n5. Add a splash of club soda.\n6. Stir once, very gently — one slow rotation maximum.\n7. Garnish with a large slice of orange inside the glass and optionally 2–3 green olives on a pick."
)
RecipeIngredient.create!(cocktail_recipe: spritz_veneziano, ingredient: blanc_vermouth, quantity: "1½ oz")
RecipeIngredient.create!(cocktail_recipe: spritz_veneziano, ingredient: aperol,         quantity: "1 oz")
RecipeIngredient.create!(cocktail_recipe: spritz_veneziano, ingredient: prosecco,       quantity: "2½ oz")
RecipeIngredient.create!(cocktail_recipe: spritz_veneziano, ingredient: club_soda,      quantity: "½ oz splash")

# ------------------------------------
# 29. Hugo Spritz
# ------------------------------------
hugo_spritz = CocktailRecipe.create!(
  user: u5,
  category: cat_mocktail,
  title: "Hugo Spritz",
  description: "The Hugo Spritz originated in South Tyrol, Italy around 2005 and has become enormously popular across Europe. It's lighter and more floral than an Aperol Spritz, built on elderflower liqueur and Prosecco with fresh mint. The St-Germain provides a lychee-floral sweetness that is irresistible with sparkling wine. It's the most crushable spritz in the family — low ABV, delicate, and the perfect summer afternoon drink.",
  directions: "1. Fill a large wine glass with ice.\n2. Add the St-Germain elderflower liqueur.\n3. Top with chilled Prosecco.\n4. Add a splash of club soda.\n5. Bruise 2 fresh mint sprigs by clapping them between your palms and add to the glass.\n6. Garnish with a thin slice of cucumber and a lime wedge on the rim."
)
RecipeIngredient.create!(cocktail_recipe: hugo_spritz, ingredient: elderflower_liq, quantity: "1½ oz")
RecipeIngredient.create!(cocktail_recipe: hugo_spritz, ingredient: prosecco,        quantity: "3 oz")
RecipeIngredient.create!(cocktail_recipe: hugo_spritz, ingredient: club_soda,       quantity: "1 oz")
RecipeIngredient.create!(cocktail_recipe: hugo_spritz, ingredient: mint_sprig,      quantity: "2 sprigs")

# ------------------------------------
# 30. Spicy Mezcal Margarita
# ------------------------------------
spicy_mezcal_margarita = CocktailRecipe.create!(
  user: u6,
  category: cat_tequila,
  title: "Spicy Mezcal Margarita",
  description: "A modern bar staple that pairs mezcal smokiness with the heat of fresh jalapeño and citrus punch of lime. The jalapeño is muddled directly in the shaker — control heat by removing seeds for mild, leaving them in for serious fire. Tajín on the rim amplifies both citrus and heat. A 50/50 mezcal-reposado split is a great middle ground if you want less smoke. Either way, double-strain to remove jalapeño solids.",
  directions: "1. Combine Tajín and kosher salt 1:1 on a small plate. Wet the rim of a rocks glass with a lime wedge and dip in the mixture.\n2. In a shaker, muddle 3–4 slices of fresh jalapeño (seeds removed for mild, seeds in for hot).\n3. Add mezcal, fresh lime juice, Cointreau, and agave syrup over the jalapeño.\n4. Fill with ice and shake hard for 15 seconds.\n5. Double-strain into the rimmed rocks glass over fresh ice — this removes the jalapeño solids.\n6. Garnish with a thin jalapeño slice and a lime wheel."
)
RecipeIngredient.create!(cocktail_recipe: spicy_mezcal_margarita, ingredient: mezcal,          quantity: "1½ oz")
RecipeIngredient.create!(cocktail_recipe: spicy_mezcal_margarita, ingredient: reposado_tequila, quantity: "½ oz")
RecipeIngredient.create!(cocktail_recipe: spicy_mezcal_margarita, ingredient: lime_juice,      quantity: "1 oz")
RecipeIngredient.create!(cocktail_recipe: spicy_mezcal_margarita, ingredient: cointreau,       quantity: "¾ oz")
RecipeIngredient.create!(cocktail_recipe: spicy_mezcal_margarita, ingredient: agave_syrup,     quantity: "¼ oz")
RecipeIngredient.create!(cocktail_recipe: spicy_mezcal_margarita, ingredient: salt_rim,        quantity: "Tajín + salt rim")

puts "Created #{CocktailRecipe.count} cocktail recipes."

# ============================================================
# COMMENTS
# ============================================================
puts "Creating comments..."

# --- Old Fashioned (5 comments) ---
Comment.create!(cocktail_recipe: old_fashioned, user: u2, content: "This is the gold standard for me. I've tried it with Elijah Craig Small Batch, Knob Creek, and Rittenhouse Rye. Rittenhouse is my favorite for an Old Fashioned — the high rye content plays beautifully with the orange bitters.")
Comment.create!(cocktail_recipe: old_fashioned, user: u3, content: "One tip: ditch the muddled cherry at the bottom. A proper Old Fashioned has no fruit salad. Spirit, sugar, water, bitters, citrus oil. That's it. The cherry is a garnish, not an ingredient.")
Comment.create!(cocktail_recipe: old_fashioned, user: u4, content: "The rich demerara syrup approach is so much better than muddling a sugar cube. More consistent sweetness every time and no undissolved sugar grit left at the bottom of the glass.")
Comment.create!(cocktail_recipe: old_fashioned, user: u5, content: "Tried this with Woodford Reserve Double Oaked last night and it was transcendent. The extra oak aging adds vanilla and coconut notes that work in perfect harmony with the orange bitters.")
Comment.create!(cocktail_recipe: old_fashioned, user: u6, content: "Made this for my father-in-law who usually drinks Scotch on the rocks and thought cocktails were for the young. He's now converted. Three Old Fashioneds later and he was asking me to write down the recipe.")

# --- Negroni (5 comments) ---
Comment.create!(cocktail_recipe: negroni, user: u1, content: "Carpano Antica Formula is the only sweet vermouth I'll use in a Negroni. Yes it costs more, but the vanilla-forward, rich character is worth every penny. Don't use Martini Rosso and then wonder why your Negroni tastes flat.")
Comment.create!(cocktail_recipe: negroni, user: u3, content: "The Negroni Sbagliato with Prosecco instead of gin is underrated. Had one at a bar in Milan and it changed my perspective on what this drink can be. Still prefer the original though.")
Comment.create!(cocktail_recipe: negroni, user: u5, content: "Perfect stirring technique matters here more than in almost any other drink. About 20–25 rotations, and let the ice do the work — don't stir aggressively or you'll introduce bubbles and cloud the drink.")
Comment.create!(cocktail_recipe: negroni, user: u7, content: "Barrel-aged Negronis are my favorite project. Combine a big batch at equal parts, put it in a small oak barrel for 2–3 weeks. The integration that happens during aging is extraordinary — the bitter edges round out completely.")
Comment.create!(cocktail_recipe: negroni, user: u8, content: "White Negroni is a great variation for people who find the original too bitter: Plymouth gin, Suze, and Lillet Blanc in equal parts. Much lighter and more floral, but the DNA is the same.")

# --- Daiquiri (4 comments) ---
Comment.create!(cocktail_recipe: daiquiri, user: u1, content: "The Daiquiri is my litmus test for any bar. If they make a great Daiquiri, they know what they're doing. Fresh juice, quality rum, properly balanced. Nothing to hide behind.")
Comment.create!(cocktail_recipe: daiquiri, user: u4, content: "I've been experimenting with a split rum base: half Plantation 3 Stars for cleanliness and half El Dorado 3yr for funkiness. The complexity from two rums is something a single rum can't achieve.")
Comment.create!(cocktail_recipe: daiquiri, user: u6, content: "The ratio matters enormously. I prefer 2oz rum / ¾oz lime / ½oz simple — slightly less sweet. The acidity really pops and the rum character comes through more clearly.")
Comment.create!(cocktail_recipe: daiquiri, user: u8, content: "Banana Daiquiri riff: add ½ oz crème de banane and reduce simple to ½ oz. Use Rhum Agricole instead of standard white rum for that grassy, funky note that plays beautifully with banana. Spectacular.")

# --- Margarita (4 comments) ---
Comment.create!(cocktail_recipe: margarita, user: u2, content: "Please, please, please: fresh lime juice only. Bottled lime juice tastes like cleaning product. Squeeze to order, or at most 30 minutes in advance. This rule is non-negotiable.")
Comment.create!(cocktail_recipe: margarita, user: u3, content: "I do half Cointreau, half fresh OJ instead of the full ounce of Cointreau. Drops the sweetness noticeably, adds brightness, feels lighter. Especially good in summer heat.")
Comment.create!(cocktail_recipe: margarita, user: u5, content: "Tommy's Margarita variation: replace the triple sec entirely with ½ oz agave syrup. This makes the tequila the absolute star. Especially revelatory with a quality reposado or a nice blanco from El Tesoro.")
Comment.create!(cocktail_recipe: margarita, user: u7, content: "For consistent spice in a spicy margarita: make jalapeño-infused simple syrup rather than muddling fresh. Better control, more consistent batch to batch, and the finished drink looks cleaner.")

# --- Moscow Mule (3 comments) ---
Comment.create!(cocktail_recipe: moscow_mule, user: u1, content: "The copper mug is not just aesthetic — it keeps the drink colder for longer and the metal conducts the cold in a way that makes the first few sips exceptionally refreshing. Worth investing in real, solid copper mugs.")
Comment.create!(cocktail_recipe: moscow_mule, user: u3, content: "Fever-Tree vs Bundaberg ginger beer debate: Fever-Tree is more citrusy and aromatic. Bundaberg is spicier and more ginger-forward. I use Bundaberg in a Mule and Fever-Tree in a Dark & Stormy.")
Comment.create!(cocktail_recipe: moscow_mule, user: u6, content: "Mexican Mule: swap vodka for blanco tequila. Sometimes called a Tequila Mule or Mexican Mule depending on the bar. It's excellent and I'd honestly argue it's better than the original.")

# --- Dark & Stormy (3 comments) ---
Comment.create!(cocktail_recipe: dark_stormy, user: u2, content: "Gosling's actually trademarked the Dark & Stormy name — technically any other rum makes it a Rum Buck. But the trademark is real, and honestly Gosling's Black Seal is genuinely the best rum for this drink anyway.")
Comment.create!(cocktail_recipe: dark_stormy, user: u4, content: "I add a small pinch of sea salt to the ginger beer before adding the rum float. It amplifies the ginger bite without increasing sweetness. Subtle but noticeable improvement.")
Comment.create!(cocktail_recipe: dark_stormy, user: u8, content: "The float technique is key. Pour slowly over the back of a bar spoon held just at the surface. Done correctly you get a dramatic two-tone effect. It mixes naturally as you drink — you taste the progression.")

# --- Whiskey Sour (4 comments) ---
Comment.create!(cocktail_recipe: whiskey_sour, user: u1, content: "The dry shake is critical and non-negotiable. Shaking without ice first allows the egg white proteins to begin denaturing from mechanical action, giving you far superior foam than if you just combined everything with ice from the start.")
Comment.create!(cocktail_recipe: whiskey_sour, user: u5, content: "I prefer Elijah Craig Barrel Proof for this. The high proof holds up to the citrus and egg white in a way that lower-proof bourbons don't — the result is bolder and more complex, even after dilution.")
Comment.create!(cocktail_recipe: whiskey_sour, user: u7, content: "New York Sour variation: after straining into the glass over ice, carefully float ½ oz of a fruity red wine (Malbec works great) on top. The wine adds tannin, fruit, and an incredible visual effect.")
Comment.create!(cocktail_recipe: whiskey_sour, user: u4, content: "Aquafaba works as a perfect egg white substitute — use 1 oz per drink and the same dry shake technique. Completely indistinguishable in texture and foam quality. Essential to know for vegan guests.")

# --- Aperol Spritz (3 comments) ---
Comment.create!(cocktail_recipe: aperol_spritz, user: u3, content: "A lot of cocktail purists dismiss this as basic, but made properly — with great prosecco at the right temperature, abundant ice, and a quality orange — it's perfect for what it is. Not everything needs to be complex.")
Comment.create!(cocktail_recipe: aperol_spritz, user: u6, content: "The Campari Spritz is more sophisticated — same format, swap Aperol for Campari. You need a small sugar cube or a dash of simple syrup to balance the extra bitterness. A more adult version of the same concept.")
Comment.create!(cocktail_recipe: aperol_spritz, user: u8, content: "Temperature control on the prosecco is crucial. Warm, flat prosecco destroys this drink completely. Keep it ice cold, open fresh, and pour gently so you don't lose carbonation before it hits the glass.")

# --- Paloma (3 comments) ---
Comment.create!(cocktail_recipe: paloma, user: u2, content: "The Paloma with Squirt grapefruit soda is the Mexican original and just as good as the fresh-juice version. More casual, easier to make, and hits differently on a hot day. Both versions are correct.")
Comment.create!(cocktail_recipe: paloma, user: u4, content: "Tajín rim is not optional in my version. The citric acid, chile, and salt amplify every single element of this drink. Don't use straight salt — do the full Tajín mix. It's genuinely different.")
Comment.create!(cocktail_recipe: paloma, user: u7, content: "Mezcal Paloma is outstanding: swap half the blanco for mezcal, and add a pinch of smoked salt to the rim. The smoke and grapefruit combination is unexpected and brilliant. Try it.")

# --- Bee's Knees (3 comments) ---
Comment.create!(cocktail_recipe: bees_knees, user: u1, content: "The quality of the honey makes a noticeable difference. Raw wildflower honey gives a more complex, floral result than standard clover honey. The extra floral notes complement the gin botanicals beautifully.")
Comment.create!(cocktail_recipe: bees_knees, user: u3, content: "Tried this with Hendrick's instead of London dry and swapped the lemon for lime. Completely different drink — more spa water, less classic cocktail — but equally delicious in its own right.")
Comment.create!(cocktail_recipe: bees_knees, user: u5, content: "Adding ¼ oz fresh thyme syrup to this turns it into something transcendent. The herbal note from thyme against the floral honey and citrus gin is one of the most complex sour cocktails I've ever made.")

# --- Paper Plane (4 comments) ---
Comment.create!(cocktail_recipe: paper_plane, user: u2, content: "This was my gateway cocktail — the one that made me stop ordering beer at bars and start exploring serious cocktails. Equal parts sounds impossible but Sam Ross is a genius and it works perfectly.")
Comment.create!(cocktail_recipe: paper_plane, user: u6, content: "Nonino vs. Montenegro as the amaro in this: Nonino is lighter, more floral, and sweeter. Montenegro is earthier and more herbal. Both work but Nonino is the classic choice and I think it's the correct one.")
Comment.create!(cocktail_recipe: paper_plane, user: u8, content: "Made these for a dinner party of 8 people who claimed they didn't like cocktails. Everyone asked for a second round. This recipe converts non-believers better than anything else I know.")
Comment.create!(cocktail_recipe: paper_plane, user: u4, content: "The equal-parts format makes batching incredibly easy. Scale up to a party, pre-batch the Aperol-bourbon-Nonino-lemon at equal parts in a pitcher, refrigerate, and shake individual portions to order.")

# --- Last Word (4 comments) ---
Comment.create!(cocktail_recipe: last_word, user: u1, content: "Green Chartreuse is one of the most complex liqueurs in existence — 130 plants and herbs, and only the monks know the full recipe. It overwhelms in some drinks but is perfectly balanced here by the maraschino and lime.")
Comment.create!(cocktail_recipe: last_word, user: u4, content: "The Division Bell: swap gin for mezcal and you have an entirely new drink that Phil Ward created at Death & Company. The smoke plays off the herbal Chartreuse in ways you wouldn't predict but absolutely work.")
Comment.create!(cocktail_recipe: last_word, user: u7, content: "Plymouth gin gives a rounder, slightly sweeter profile that softens the Chartreuse somewhat. Tanqueray No. Ten makes it more citrusy and assertive. Both excellent — different moods call for different choices.")
Comment.create!(cocktail_recipe: last_word, user: u3, content: "Use Luxardo maraschino specifically, not a cheaper substitute. The difference between Luxardo and generic maraschino in this drink is dramatic — real Luxardo has depth and richness that the formulation demands.")

# --- Penicillin (4 comments) ---
Comment.create!(cocktail_recipe: penicillin, user: u2, content: "This is the most complex flavor experience in a shaken cocktail that I know of. Citrus-honey-ginger on the attack, blended Scotch in the middle, and then retronasal Islay peat on the long finish. Extraordinary.")
Comment.create!(cocktail_recipe: penicillin, user: u5, content: "Caol Ila 12yr is my preferred Islay float — it's peaty but also has a coastal, vegetal quality that adds dimension rather than just dominating with smoke. Laphroaig is great but can overpower if you're heavy-handed.")
Comment.create!(cocktail_recipe: penicillin, user: u8, content: "Make the ginger-honey syrup with fresh ginger root only — never powdered or jarred. Peel, slice thin, steep in warm honey syrup for 20 minutes, strain. Keeps for 2 weeks refrigerated. The flavor is completely different from any shortcut.")
Comment.create!(cocktail_recipe: penicillin, user: u6, content: "Blended Scotch choice matters more than you'd think. The Macallan Double Cask 12yr gives a richer, sherry-influenced base that plays beautifully with the peat float. Monkey Shoulder is a reliable workhorse at a great price point.")

# --- French 75 (3 comments) ---
Comment.create!(cocktail_recipe: french_75, user: u3, content: "Gin or cognac — that's the eternal French 75 debate. Gin is historically correct (cognac version came later). Gin is also more interesting because the botanicals create a genuine dialogue with the Champagne. Always order gin.")
Comment.create!(cocktail_recipe: french_75, user: u6, content: "For a party, batch the gin-lemon-syrup base at 3:1:1 ratio in a pitcher and refrigerate. Pour 2 oz of the batch per flute and top with Champagne. You can make 50 cocktails in under five minutes.")
Comment.create!(cocktail_recipe: french_75, user: u8, content: "NV Billecart-Salmon Brut is my Champagne of choice for cocktails when I want to splurge. Pol Roger is great too. For a budget-friendly option, Gruet from New Mexico is surprisingly solid at a fraction of the price.")

# --- Espresso Martini (4 comments) ---
Comment.create!(cocktail_recipe: espresso_martini, user: u1, content: "Foam quality is everything. Use freshly pulled espresso, fill the shaker completely with ice, and shake as hard as you've ever shaken anything for a full 20 seconds. The ice must break down slightly to create the foam.")
Comment.create!(cocktail_recipe: espresso_martini, user: u4, content: "Mr Black cold brew liqueur is a game-changer here — swap it for the Kahlúa. It's less sweet, far more intensely coffee-forward, and much more complex. If you can find it, use it. The difference is significant.")
Comment.create!(cocktail_recipe: espresso_martini, user: u7, content: "The vanilla syrup is optional but I strongly recommend it — ¼ oz Monin vanilla adds a subtle sweetness that rounds the bitterness of the coffee beautifully. Don't go over ¼ oz or it becomes cloying.")
Comment.create!(cocktail_recipe: espresso_martini, user: u5, content: "Counterintuitive fact: older ice from the back of your freezer (with some whiteness to it) produces a better foam than freshly made ice. The trapped air in fresh ice actually works against you here.")

# --- Jungle Bird (4 comments) ---
Comment.create!(cocktail_recipe: jungle_bird, user: u2, content: "Campari and pineapple juice is a combination I never would have predicted works, yet it absolutely does. The bitterness cuts through the sweetness of pineapple and the dark rum ties it all together. Brilliant drink.")
Comment.create!(cocktail_recipe: jungle_bird, user: u5, content: "A Jungle Bird variation with Cynar instead of Campari leans more earthy and agave-bitter. Pairs really interestingly with aged rum like Appleton 12yr. Worth trying if you love the original.")
Comment.create!(cocktail_recipe: jungle_bird, user: u8, content: "Fresh pineapple juice (pressed from a whole pineapple) vs canned is night and day here. Fresh is brighter, more acidic, and has a subtle grassy tropical note. Worth the extra effort if you're making a batch.")
Comment.create!(cocktail_recipe: jungle_bird, user: u1, content: "This is the drink I make when someone tells me they don't like tiki cocktails. The Campari brings enough bitterness and sophistication to win over people who find most tiki drinks too sweet.")

# --- Porn Star Martini (3 comments) ---
Comment.create!(cocktail_recipe: porn_star_martini, user: u3, content: "The side Champagne is genuinely functional, not just a gimmick. Sip the main drink, then take a sip of Champagne. The effervescence cleans your palate and the bubbles highlight the tropical sweetness on the next sip. It's a ritual.")
Comment.create!(cocktail_recipe: porn_star_martini, user: u6, content: "Ketel One Vodka is the right call here — the neutral, clean profile lets the passion fruit and vanilla shine. Flavored vodkas compete with the passion fruit rather than supporting it.")
Comment.create!(cocktail_recipe: porn_star_martini, user: u7, content: "Monin passion fruit syrup is a reliable backup if fresh passion fruit isn't available. Avoid the cheap brands — the artificial flavor ruins everything. Funkin passion fruit puree is widely available and excellent.")

# --- Clover Club (3 comments) ---
Comment.create!(cocktail_recipe: clover_club, user: u1, content: "One of the most underrated cocktails in the pre-Prohibition canon. The egg white foam is silky, the raspberry adds tartness rather than just sweetness, and the gin botanicals come through beautifully. Tell anyone who'll listen.")
Comment.create!(cocktail_recipe: clover_club, user: u4, content: "I make my raspberry syrup with 50% fresh raspberries and 50% freeze-dried raspberries. The freeze-dried concentrate the flavor without adding extra water, so the syrup is more intensely fruity and the color is more vibrant.")
Comment.create!(cocktail_recipe: clover_club, user: u8, content: "Aquafaba (liquid from a can of chickpeas) works as an egg white substitute and is indistinguishable in terms of foam quality. Use 1 oz per drink, same dry shake technique. Perfect for vegan guests.")

# --- Toronto (3 comments) ---
Comment.create!(cocktail_recipe: toronto, user: u2, content: "The Toronto is a bartender's cocktail in the best sense — approachable enough to order anywhere but complex enough to reward a knowledgeable palate. The Fernet is the key: just a quarter ounce, but it changes everything.")
Comment.create!(cocktail_recipe: toronto, user: u5, content: "Rittenhouse Bottled-in-Bond (100 proof) is my rye for this. The higher proof holds up against the assertive character of Fernet-Branca. Lower-proof ryes get swamped by the bitterness.")
Comment.create!(cocktail_recipe: toronto, user: u7, content: "If you find Fernet too medicinal, Cynar or Amaro Montenegro are softer substitutes that still bring the necessary bitter-herbal element. The drink changes character significantly but remains excellent.")

# --- Aviation (4 comments) ---
Comment.create!(cocktail_recipe: aviation, user: u3, content: "The Aviation without crème de violette is just a gin sour with maraschino. The violette is the soul of the drink — it provides the color, the floral note, and the full complexity. If your bar doesn't have it, find one that does.")
Comment.create!(cocktail_recipe: aviation, user: u6, content: "Rothman & Winter is the most widely available crème de violette and it's excellent. Tempus Fugit makes a more intense version. Both are correct, but R&W gives a prettier, more vibrant purple-blue color in the finished drink.")
Comment.create!(cocktail_recipe: aviation, user: u8, content: "Hendrick's gin is a great choice here — the rose and cucumber notes complement the violette and maraschino perfectly. A heavy juniper gin like standard Tanqueray can come across as abrasive against the delicate florals.")
Comment.create!(cocktail_recipe: aviation, user: u2, content: "The Aviation is a reminder that pre-Prohibition bartenders were doing genuinely remarkable, creative work. This drink is over 100 years old and still feels modern. Hugo Ensslin deserves far more credit in cocktail history.")

# --- Mezcal Negroni (3 comments) ---
Comment.create!(cocktail_recipe: mezcal_negroni, user: u1, content: "Del Maguey Vida is the classic mezcal for this and it's excellent. But if you want to go deeper, try Banhez Ensamble — the mix of espadín and barril agave gives an earthy, fruity smokiness that's unlike anything else.")
Comment.create!(cocktail_recipe: mezcal_negroni, user: u4, content: "I do a 50/50 mezcal and blanco tequila base to tame the smoke slightly. This gives you agave sweetness with just a hint of smoke. Great entry point for people who are new to mezcal cocktails.")
Comment.create!(cocktail_recipe: mezcal_negroni, user: u7, content: "Punt e Mes is a fantastic sweet vermouth choice here — it's more bitter and darker than standard sweet vermouth, which plays really well with the smoky mezcal. Reduces the candy-like quality of the standard Negroni.")

# --- Amaretto Sour (3 comments) ---
Comment.create!(cocktail_recipe: amaretto_sour, user: u2, content: "Jeffrey Morgenthaler is a genius for rescuing this drink. Before his version, Amaretto Sours were a joke — sweet, cloying, and infantile. The bourbon addition changes the entire character. Every bartender should know this recipe.")
Comment.create!(cocktail_recipe: amaretto_sour, user: u5, content: "Wild Turkey 101 is the perfect bourbon for this — the high rye content and 50.5% ABV give enough backbone to balance the sweetness. Don't use a wheated bourbon; it'll be too soft and get swallowed by the amaro.")
Comment.create!(cocktail_recipe: amaretto_sour, user: u8, content: "The Angostura on the foam is not just decorative. Three drops and a toothpick drag creates a marbled pattern, and the bitters actually aromatics the foam on the nose — you smell the spice before you taste the drink.")

# --- Sazerac (3 comments) ---
Comment.create!(cocktail_recipe: sazerac, user: u3, content: "The absinthe rinse is everything in a Sazerac. Use real absinthe — Vieux Pontarlier or Pernod Absinthe are excellent choices. Coat the glass thoroughly and discard. You want the ghost of absinthe, not a mouthful of it.")
Comment.create!(cocktail_recipe: sazerac, user: u6, content: "The lemon peel is expressed and DISCARDED in a proper Sazerac — this is one of the most commonly violated rules in cocktail making. Many bars drop it in. The expressed oils coat the surface; the peel has no business inside the glass.")
Comment.create!(cocktail_recipe: sazerac, user: u7, content: "Thomas H. Handy Sazerac Rye (if you can find it) makes the most extraordinary version I've ever tasted. It's bottled at barrel proof, so you may want to slightly increase the water when muddling the sugar. Worth seeking out.")

# --- Mai Tai (4 comments) ---
Comment.create!(cocktail_recipe: mai_tai, user: u1, content: "Orgeat quality makes or breaks a Mai Tai. Most commercial orgeat is too sweet and too almond-extract-forward. Liber & Co, Small Hand Foods, or homemade orgeat (blanched almonds, sugar, orange blossom water) are the right choices.")
Comment.create!(cocktail_recipe: mai_tai, user: u4, content: "The rum split is crucial. Appleton Estate 12yr + Smith & Cross overproof Jamaican is my preferred combination. The Smith & Cross has a wild, funky hogo note that gives the drink incredible depth and authenticity.")
Comment.create!(cocktail_recipe: mai_tai, user: u7, content: "Trader Vic's original used 17-year-old J. Wray & Nephew — now selling for thousands per bottle. El Dorado 15yr is the closest modern approximation of that complex aged rum character and it's still reasonably priced.")
Comment.create!(cocktail_recipe: mai_tai, user: u6, content: "The crushed ice is non-negotiable for a proper tiki Mai Tai. It chills more quickly and creates the right dilution rate for the drink. Regular ice cubes make the drink taste flat and underdiluted in a strange way.")

# --- Vieux Carré (3 comments) ---
Comment.create!(cocktail_recipe: vieux_carre, user: u2, content: "The dual spirit base — rye plus cognac — is what makes this so interesting. It occupies a unique flavor space that neither a Manhattan nor a Sidecar can claim. The Peychaud's gives it quintessential New Orleans character.")
Comment.create!(cocktail_recipe: vieux_carre, user: u5, content: "Use Pierre Ferrand 1840 cognac — it's specifically formulated for use in cocktails, with higher proof and more robust flavor than standard VS cognacs. Mixed drinks require spirits that won't disappear into the blend.")
Comment.create!(cocktail_recipe: vieux_carre, user: u8, content: "This was the drink that converted me to stirred cocktails. Before this, I thought stirred drinks were boring compared to shaken. The Vieux Carré's complexity and the way each sip reveals something new completely changed my perspective.")

# --- Gimlet (3 comments) ---
Comment.create!(cocktail_recipe: gimlet, user: u3, content: "I did a side-by-side: fresh lime Gimlet vs Rose's Lime Cordial Gimlet. Fresh juice is brighter, more acidic, more complex. Rose's is sweeter, more uniform, and strangely nostalgic. Both have merit depending on mood and context.")
Comment.create!(cocktail_recipe: gimlet, user: u6, content: "Hendrick's + cucumber ribbon garnish + fresh lime is an incredible summer Gimlet. The botanical profile of Hendrick's already contains cucumber notes, and a thin cucumber ribbon doubles down on that refreshing quality.")
Comment.create!(cocktail_recipe: gimlet, user: u8, content: "The Gimlet is essentially a gin Daiquiri with lime instead of lemon. Same structure, same ratios, same philosophy. Understanding the sour template — spirit, citrus, sweetener — unlocks the entire cocktail world.")

# --- Naked & Famous (3 comments) ---
Comment.create!(cocktail_recipe: naked_famous, user: u1, content: "Yellow Chartreuse is gentler and more floral than Green — it makes this slightly sweeter and less herbal-intense. The balance with the smoky mezcal and bitter Aperol is really precise. It's a great drink.")
Comment.create!(cocktail_recipe: naked_famous, user: u4, content: "Ilegal Joven mezcal works beautifully here — fresh, grassy, and relatively light-smoke. The lighter smoke profile lets the Yellow Chartreuse come through clearly. A heavily peated mezcal would dominate everything.")
Comment.create!(cocktail_recipe: naked_famous, user: u7, content: "This is tied with the Paper Plane as my go-to 'impress non-cocktail friends' drink. Equal parts format means easy to batch for a party. Makes an enormous impression every single time.")

# --- Spritz Veneziano (2 comments) ---
Comment.create!(cocktail_recipe: spritz_veneziano, user: u2, content: "I served this at a summer dinner party in a big pitcher with orange slices, olives, and cucumber. Eight people went through two bottles of prosecco in 45 minutes. The most successful cocktail I've ever batched.")
Comment.create!(cocktail_recipe: spritz_veneziano, user: u6, content: "Dolin Blanc is my blanc vermouth of choice here — delicate, floral, and not overpowering. Carpano Bianco is also excellent but slightly richer and sweeter. Noilly Prat Dry is the wrong call — too austere for a spritz.")

# --- Hugo Spritz (2 comments) ---
Comment.create!(cocktail_recipe: hugo_spritz, user: u3, content: "The Hugo is having a massive moment in Southern Europe and it completely deserves it. The elderflower-mint combination is utterly unique — nothing else in the spritz family tastes anything like it.")
Comment.create!(cocktail_recipe: hugo_spritz, user: u5, content: "I add a thin slice of cucumber and a sprig of fresh lemon verbena when I have it. The verbena adds a lemon-floral note that takes the Hugo somewhere truly special. It's become my most-requested summer drink.")

# --- Spicy Mezcal Margarita (3 comments) ---
Comment.create!(cocktail_recipe: spicy_mezcal_margarita, user: u1, content: "Jalapeño heat is variable — one jalapeño can be mild, the next searing. Muddle gently, taste the shaker liquid before adding ice, and adjust accordingly. You can always add more heat; you can never take it away.")
Comment.create!(cocktail_recipe: spicy_mezcal_margarita, user: u4, content: "I make jalapeño-infused mezcal: steep 2 sliced jalapeños (seeds in) in a bottle of mezcal for 2 hours, taste, strain. Gives absolutely consistent heat level every time. The infused mezcal is also incredible in a Naked & Famous.")
Comment.create!(cocktail_recipe: spicy_mezcal_margarita, user: u7, content: "Serrano pepper instead of jalapeño gives a cleaner, brighter heat with a more citrusy quality. Habanero (very sparingly) adds a fruity tropical note along with the heat. Each chile has a completely different flavor profile beyond just spice level.")

puts "Created #{Comment.count} comments."

# ============================================================
# UPDATE COMMENTS COUNT
# ============================================================
puts "Updating comment counters..."
CocktailRecipe.find_each { |r| CocktailRecipe.reset_counters(r.id, :comments) }

puts "\n=== Seed Complete ==="
puts "Users:              #{User.count}"
puts "Categories:         #{Category.count}"
puts "Ingredients:        #{Ingredient.count}"
puts "Cocktail Recipes:   #{CocktailRecipe.count}"
puts "Recipe Ingredients: #{RecipeIngredient.count}"
puts "Comments:           #{Comment.count}"
