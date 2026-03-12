# Mike's Cantina

A full-stack Rails 8 cocktail recipe platform where users share, discover, and discuss craft cocktail recipes — now with an AI-powered bartender powered by the OpenAI API.

## Features

- **Recipe management** — Create, edit, and delete cocktail recipes with photos, ingredients, and step-by-step directions
- **Category & ingredient browsing** — Filter recipes by category, ingredient, or username
- **Comments** — Leave feedback on any recipe; popular recipes are surfaced via a comment counter cache
- **User profiles** — Each profile shows the recipe of the day, the most-commented recipe, and the five newest submissions
- **AI Bartender** — A streaming chat interface backed by OpenAI GPT-4.1; signed-in users get persistent conversation history, guests get session-scoped history
- **OAuth** — Sign in with GitHub via Devise OmniAuth
- **Image uploads** — Active Storage backed by Cloudinary
- **Tailwind CSS + daisyUI** — Utility-first styling with Turbo/Stimulus for seamless page transitions

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Rails 8.0 |
| Database | SQLite 3 |
| Auth | Devise + OmniAuth (GitHub) |
| Frontend | Turbo, Stimulus, Tailwind CSS v4, daisyUI |
| Storage | Active Storage + Cloudinary |
| AI | OpenAI API (streaming via SSE) |
| Deployment | Kamal + Docker + Thruster |

## Prerequisites

- Ruby (see `.ruby-version`)
- Bundler
- Node.js (required for Tailwind CSS plugin resolution)
- A Cloudinary account
- An OpenAI API key (for AI bartender functionality)

## Setup

```bash
git clone https://github.com/chrisbaptiste83/rails-cocktail-app.git
cd rails-cocktail-app
bundle install
```

Copy the environment template and fill in your credentials:

```bash
cp .env.example .env   # or set vars in your shell
```

Set up the database and seed it with cocktail data from TheCocktailDB:

```bash
bin/rails db:migrate
bin/rails db:seed
```

Start the development server:

```bash
bin/rails server
```

In a separate terminal, watch for Tailwind changes:

```bash
bin/rails tailwindcss:watch
```

Navigate to `http://localhost:3000`.

## Environment Variables

| Variable | Required | Description |
|---|---|---|
| `OPENAI_API_KEY` | Yes (for AI) | OpenAI secret key |
| `OPENAI_BARTENDER_MODEL` | No | Model override (default: `gpt-4.1`) |
| `COCKTAILDB_API_KEY` | No | TheCocktailDB key (default: test key) |
| `CLOUDINARY_URL` | Yes | Cloudinary connection string |

## Usage

1. Sign up at `/users/sign_up` or use **Sign In with GitHub**
2. After sign-in you land on your profile page — recipe of the day, most-commented recipe, and five newest recipes are shown here
3. Use the top navigation to browse all recipes or create a new one
4. Filter recipes by category, ingredient, or user from the index page
5. Ask the AI Bartender anything — it knows your current cocktail menu and can recommend a drink based on your vibe, preferred spirit, or glassware
6. Use **Clear Chat** to reset the bartender conversation

## Running Tests

```bash
bin/rails test              # all unit + controller tests
bin/rails test:system       # Capybara system tests (requires Chrome)
```

## Deployment

This app deploys via [Kamal](https://kamal-deploy.org/). Ensure your `.kamal/secrets` file has the required credentials, then:

```bash
kamal setup    # first deploy
kamal deploy   # subsequent deploys
```

A `/up` health check endpoint is exposed for kamal-proxy.

## Project Structure

```
app/
├── controllers/         # HomeController, CocktailRecipesController, AiBartenderController, …
├── models/              # User, CocktailRecipe, Ingredient, Category, Comment, AiConversation, AiMessage
├── services/            # AiBartender — OpenAI API wrapper with streaming support
├── views/               # ERB templates
└── javascript/          # Stimulus controllers

test/
├── models/              # Unit tests for all models
├── controllers/         # Integration tests for key controllers
└── fixtures/            # YAML fixture data
```

## Contributing

Bug reports and pull requests are welcome at <https://github.com/chrisbaptiste83/rails-cocktail-app>.

Please open an issue before submitting a large change so we can discuss the approach first.
