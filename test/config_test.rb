require 'test_helper'
require 'uri'
class ConfigTest < Test::Unit::TestCase
  include BillboardApi
  def setup
    @config = Config.instance
    @config.clear!
  end
  should "Return nil on unknown config" do
        assert_equal nil, @config.test_property
      end
      
      should 'return the value upon set operation' do
        assert 'test', (@config.test_property= 'test')
      end
      
  should 'store and return a setting' do
    assert 'test', (@config.test_property= 'test')
    assert 'test', @config.test_property
  end
  
  should 'update an existing property' do
    assert 'bla', (@config.test_property= 'bla')
    assert 'bla', @config.test_property
    assert 'test', (@config.test_property= 'test')
    assert 'test', @config.test_property
  end
  
  
  should 'Allow configuration trough block' do
    Config.configure do |conf|
      conf.foobar= 'http://foo.bar'
    end
    assert_equal 'http://foo.bar', @config.foobar
  end
  
  
  should 'allow override of setting' do
    @config.bla = 12
    assert_equal 13, @config.bla(13)
  end
  
  should 'validate! only if all required settings are present' do
    assert_raises RuntimeError do
      Config.instance.validate!  
    end
    Config.configure do |config|
      config.return_after_payment_url= '1'
      config.paypal_service_url= 2
      config.paypal_notify_url= 3
      config.paypal_receiver_email= 4
      config.site_url = 'http://localhost:3000'
    end
    Config.instance.validate!
  end
  
  should 'set site_url to Tax and Order' do
      Config.instance.site_url = 'http://foo.bar.com'
      assert_equal 'http://foo.bar.com', Order.site.to_s
      assert_equal 'http://foo.bar.com', Tax.site.to_s
  end
end
