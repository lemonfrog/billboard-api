require 'rubygems'
require 'activeresource'
require 'singleton'

%w[remote_resource order customer payment_method currency tax config default_config].each do |name|
  require File.join(File.dirname(__FILE__), 'billboard-api', name)
end

