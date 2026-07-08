Imagekit::Rails.configure do |config|
  config.public_key    = ENV.fetch('IMAGEKIT_PUBLIC_KEY', 'dummy_public_key')
  config.private_key   = ENV.fetch('IMAGEKIT_PRIVATE_KEY', 'dummy_private_key')
  config.url_endpoint  = ENV.fetch('IMAGEKIT_URL_ENDPOINT', 'https://ik.imagekit.io/dummy')
end
