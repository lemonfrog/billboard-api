module BillboardApi
  
  #
  # Following Settings are required:
  #  * return_after_payment_url
  #  * paypal_service_url
  #  * billboard_notify_url
  #  * paypal_receiver_email
  
  
  
  #
  # Config is a singleton instance which can be used in two ways:
  # Config.instance.setting_name1 = 12
  # Config.instance.setting_name2 = 24
  # or the (shorter, depending on amount of settings) form with a block
  # Config.configure do |config|
  #  config.setting_name1= 12
  #  config.setting_name2= 24
  # end 
  #
  #
  # the accessors have possibility to override
  # settings. This is useful for custom settings on a lower level
  #
  # config.setting_name1(12)
  # => will return 12 all the time which does not make much sense...
  # config.setting_name(options[:override_setting_name1]) will return the not-nil value from options has
  # or the setting stored in config.
  #
  class Config
    include Singleton
    
    REQUIRED_SETTINGS = [:return_after_payment_url, :paypal_service_url, :billboard_notify_url, :paypal_receiver_email]
    
    # Overwrite site urls since they are directly applied to the 
    # Order class' class variable 'site'
    def order_site_url(override = nil)
      override || Order.site
    end
    def order_site_url=(value)
      Order.site= value
    end
        
    # Allow access for arbitrary settings    
    def method_missing(m, *args)
      if !m.to_s.ends_with?('=') && args.length <= 1
        # return override or setting
        args.first || settings[m.to_s]
      elsif m.to_s.ends_with?('=') && args.length == 1
        settings[m.to_s[0...-1]] = args.first
      else
        super(m, args)
      end
    end
    
    # Helper method to ensure all settings are present.
    # Will raise a StandardError if Config is invalid.
    def validate!
      REQUIRED_SETTINGS.each do |name|
        raise "Settings '#{name}' is required. Use 'Config.instance.#{name}= VALUE' to set a value" unless self.send(name) 
      end
    end
 
    
    
    # Configure with a block
    # will yield the instance of Config to the block.
    def self.configure(&block)
      config = Config.instance
      yield(instance) if block_given?
    end
    
    private
    def settings
      @settings ||= {}
    end
  end
end