# Mike's Cantina

A full-stack Rails 8 cocktail recipe platform where users share, discover, and discuss craft cocktail recipes — with an AI-powered bartender backed by the OpenAI API.

[![Ruby](https://img.shields.io/badge/Ruby-3.4.2-CC342D?logo=ruby&logoColor=white)](https://ruby-lang.org)
[![Rails](https://img.shields.io/badge/Rails-8.0-CC0000?logo=rubyonrails&logoColor=white)](https://rubyonrails.org)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-336791?logo=postgresql&logoColor=white)](https://postgresql.org)

## Features

- **Recipe management** — Create, edit, and delete cocktail recipes with photos, ingredients, and step-by-step directions
- **Category & ingredient browsing** — Filter recipes by category, ingredient, or username
- **Comments** — Leave feedback on any recipe; popular recipes are surfaced via a comment counter cache
- **User profiles** — Each profile shows the recipe of the day, the most-commented recipe, and the five newest submissions
- **AI Bartender** — Streaming chat interface backed by OpenAI GPT-4.1; signed-in users get persistent conversation history, guests get session-scoped history
- **OAuth** — Sign in with GitHub via Devise OmniAuth
- **Image uploads** — Active Storage backed by Cloudinary CDN
- **Tailwind CSS + daisyUI** — Utility-first styling with Turbo/Stimulus for seamless, SPA-like page transitions

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Rails 8.0 |
| Language | Ruby 3.4.2 |
| Database | PostgreSQL 16 |
| Auth | Devise + OmniAuth (GitHub) |
| Frontend | Turbo, Stimulus, Tailwind CSS v4, daisyUI |
| Storage | Active Storage + Cloudinary |
| AI | OpenAI API (streaming via SSE) |
| Deployment | GCP Cloud Run via GitLab CI |

## Prerequisites

- Ruby 3.4.2 (managed via `rbenv` — see `.ruby-version`)
- Bundler 2.x
- Node.js 20+ (required for Tailwind CSS v4 plugin resolution)
- PostgreSQL 14+
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
cp .env.example .env
```

Create and seed the database:

```bash
bin/rails db:create db:migrate db:seed
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
| `PGUSER` | No | PostgreSQL user (default: `chris`) |
| `PGPASSWORD` | No | PostgreSQL password |
| `PGHOST` | No | PostgreSQL host (default: `localhost`) |
| `DATABASE_URL` | Production | Full PostgreSQL connection URL |

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

This app deploys via **GitLab CI** (`.gitlab-ci.yml`) to **GCP Cloud Run** (`trinitas-forge` project, `us-west1` region).

- Pushing to `main` automatically runs tests, builds the container image to Google Artifact Registry, and deploys to Cloud Run (`min-instances=1`).
- Live URL: `https://rails-cocktail-app-o3clvemm7a-uw.a.run.app`
- A `/up` health check endpoint is exposed for Cloud Run startup probes.

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
