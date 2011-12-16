require 'test_helper'
require 'uri'
class ConfigTest < Test::Unit::TestCase
  include BillboardApi

  def setup
    @config = Config.instance
  end

  should 'set url to Tax and Order' do
      Config.instance.url = 'http://foo.bar.com'
      assert_equal 'http://foo.bar.com', Order.site.to_s
      assert_equal 'http://foo.bar.com', Tax.site.to_s
  end
end
