%w[order customer payment_method currency tax environment].each do |name|
  require File.join(File.dirname(__FILE__), 'billboard-api', name)
end
