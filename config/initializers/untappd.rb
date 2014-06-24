require 'untappd'
# require 'oauth'

Untappd.configure do |config|
  config.client_id = ENV['UNTAPPD_CLIENT_ID']
  config.client_secret = ENV['UNTAPPD_CLIENT_SECRET']
  config.redirect_url = 'YOUR_OAUTH_REDIRECT_URL' # only if you're using OAuth
  config.gmt_offset = -8

end