module BillboardApi
  class Config
    include Singleton

    attr_reader :url
    attr_accessor :paypal_service_url

    def initialize
      if production?
        self.url = "https://simplebillboard.com"
        self.paypal_service_url = "https://www.paypal.com/cgi-bin/webscr?"
      else
        self.url = "https://simplebillboard.com.simplificator.com"
        self.paypal_service_url = "https://www.sandbox.paypal.com/cgi-bin/webscr?"
      end
    end

    def url=(value)
      RemoteResource.site = value
      @url = value
    end

    private

    def production?
      !(defined? Rails) || Rails.env.production?
    end
  end
end