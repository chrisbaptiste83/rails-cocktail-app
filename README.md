## Welcome To Mike's Cantina

Welcome to Mike's Cantina. Mike's Cantina is a rails based application that stores a collection of the best cocktail recipes. A user that signs up can share their favorite cocktail recipes and browse through a collection of cocktail recipes submitted by other users. In addition, a user can also edit their cocktail recipes and comment on all cocktail recipes. A user has a profile page which displays the cocktail recipe of the day, the most talked about cocktail recipe, and the five newest recipes. Cocktail recipes can be browsed by their user, title, ingredients, and category.  

## Getting Started: 

Fork and clone this repository into your local machine. Cd into the repository's root directory and run bundle install to install the desired gem dependencies. 

## Usage: 

Cd into the application's root directory and run rails s to start up the server. Navigate to localhost:3000/ in your web browser to begin interacting with the application. 

1. Click on the Sign Up link on the home page to create a new profile. 
2. At the sign up screen, enter the required fields and submit the information or click on the "Sign In with Github" link to create a profile with your github profile information. 
3. Once users create a profile, they are redirected to their profile page where they can see the most recent recipes, the most commented recipe, and a random recipe of the day.
Click on any of the links to navigate the application. A user can create a cocktail recipe or browse all existing recipes by applying several filters (user, category, ingredient). 
4. After users are finished browsing through cocktail recipes or creating their own, they can click on the log out link to log out of the application.

## AI Bartender (OpenAI API)

Set an API key before running the app:

```
OPENAI_API_KEY=your_key_here
```

Optional:

```
OPENAI_BARTENDER_MODEL=gpt-4.1
```

The AI bartender form lives on the home page and now keeps a short chat history. Signed-in users get persistent chat history stored in the database. Use "Clear Chat" to reset.
Streaming replies are enabled via a server-sent events endpoint, so responses appear as they are generated.

## Cocktail API Seeding

The seed script pulls from TheCocktailDB. You can override the default test key:

```
COCKTAILDB_API_KEY=your_key_here
```

Run:

```
bin/rails db:migrate
bin/rails db:seed
```

## Tailwind CSS

Tailwind is installed via `tailwindcss-rails`. In development, run:

```
bin/rails tailwindcss:watch
```

For a production build:

```
bin/rails tailwindcss:build
```

## Contributing:

Bug reports and pull requests are welcome on GitHub at https://github.com/chrisbaptiste83/rails-cocktail-app.
