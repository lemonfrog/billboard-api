module BillboardApi
  class Order < ActiveResource::Base
    self.site = "http://billboard.garden.u2.simplificator.com"
  end
end