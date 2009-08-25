puts "default config"
BillboardApi::Config.configure do |config|
  
  # if running from rails, then set values depending on environment
  if defined? RAILS_ENV
    if RAILS_ENV == 'test'
      config.paypal_service_url = "https://www.sandbox.paypal.com/cgi-bin/webscr?"
    elsif RAILS_ENV == 'development'
      config.paypal_service_url = "https://www.sandbox.paypal.com/cgi-bin/webscr?"
    elsif RAILS_ENV == 'staging'
      config.paypal_service_url = "https://www.sandbox.paypal.com/cgi-bin/webscr?"
    elsif RAILS_ENV == 'production'
      config.paypal_service_url = "https://www.paypal.com/cgi-bin/webscr?"
    end
  else 
    puts "Not in rails, no defaults set"
  end
  # default values
  config.site_url = 'http://billboard.garden.u2.simplificator.com'
end