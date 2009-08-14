module BillboardApi
  class Tax < ActiveResource::Base
    self.site = "http://billboard.garden.u2.simplificator.com"
  end
end