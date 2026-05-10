Imagekit::Rails.configure do |config|
  config.public_key    = GoogleSecrets.fetch('IMAGEKIT_PUBLIC_KEY')
  config.private_key   = GoogleSecrets.fetch('IMAGEKIT_PRIVATE_KEY')
  config.url_endpoint  = GoogleSecrets.fetch('IMAGEKIT_URL_ENDPOINT')
end
