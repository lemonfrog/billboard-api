module BillboardApi
  # Common superclass to all ActiveResources in Billboard.
  class RemoteResource < ActiveResource::Base
    if Rails.env.production?
      self.site = "https://simplebillboard.com"
    else
      self.site = "https://simplebillboard.com.simplificator.com"
    end
  end
end