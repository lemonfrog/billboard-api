if defined? RAILS_ENV
  if RAILS_ENV == 'test'
    BillboardApi::PAYPAL_SERVICE_URL = "https://www.sandbox.paypal.com/cgi-bin/webscr?"
  elsif RAILS_ENV == 'development'
    BillboardApi::PAYPAL_SERVICE_URL = "https://www.sandbox.paypal.com/cgi-bin/webscr?"
  elsif RAILS_ENV == 'staging'
    BillboardApi::PAYPAL_SERVICE_URL = "https://www.sandbox.paypal.com/cgi-bin/webscr?"
  elsif RAILS_ENV == 'production'
    BillboardApi::PAYPAL_SERVICE_URL = "https://www.paypal.com/cgi-bin/webscr?"
  end
else 
  puts "Not in rails, no defaults set"
end



Order.site = "http://billboard.garden.u2.simplificator.com"