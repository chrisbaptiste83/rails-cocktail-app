## Welcome To Mike's Cantina

Welcome to Mike's Cantina. Mike's Cantina is a rails based application that stores a collection of the best cocktail recipes. A user that signs up can share their favorite cocktail recipes and browse through a collection of cocktail recipes submitted by other users. In addition, a user can also edit their cocktail recipes and comment on all cocktail recipes. A user has a profile page which displays the cocktail recipe of the day, the most talked about cocktail recipe, and the five newest recipes. Cocktail recipes can be browsed by their user, title, ingredients, and category.  

## Getting Started: 

Fork and clone this repository into your local machine. Cd into the repository's root directory and run bundle install to install the desired gem dependencies. 

## Usage: 

Start up the backend rails server by running rails s -p 3001. Ensure you specify port 3001 otherwise the backend and front end will attempt to run on the same port as both the default port for Rails and React is 3000. Open another terminal, cd into the application's root directory and then cd into the client folder. Run npm start or yarn start to start up the front end server. Navigate to http://localhost:3000/ on your web browser to begin interacting with the application. 

1. Click on the Sign Up link on the home page to create a new profile. 
2. At the sign up screen, enter the required fields and submit the information or click on the "Sign In with Github" link to create a profile with your github profile information. 
3. Once users create a profile, they are redirected to their profile page where they can see the most recent recipes, the most commented recipe, and a random recipe of the day.
Click on any of the links to navigate the application. A user can create a cocktail recipe or browse all existing recipes by applying several filters (user, category, ingredient). 
4. After users are finished browsing through cocktail recipes or creating their own, they can click on the log out link to log out of the application.

## Contributing:

Bug reports and pull requests are welcome on GitHub at https://github.com/chrisbaptiste83/rails-cocktail-app.





