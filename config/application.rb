require_relative "boot"

require "rails/all"
require_relative "../lib/google_secrets"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsCocktailApp
  class Application < Rails::Application
    # Ensure RAILS_MASTER_KEY is set from GCP if running in production
    if Rails.env.production? && ENV["RAILS_MASTER_KEY"].blank?
      ENV["RAILS_MASTER_KEY"] = GoogleSecrets.fetch("RAILS_MASTER_KEY")
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.active_storage.variant_processor = :vips

    config.middleware.use Rack::Attack
  end
end
