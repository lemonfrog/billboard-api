require "rubygems"
require "activeresource"
require "singleton"

%w[config remote_resource order customer payment_method currency tax].each do |name|
  require File.join(File.dirname(__FILE__), "billboard-api", name)
end

