module BillboardApi
  # Common superclass to all ActiveResources in Billboard.
  class RemoteResource < ActiveResource::Base
    self.site = BillboardApi::Config.instance.url
    #For Rails >= 3.1 the default request format has been changed from xml to json
    #Setting it manually ensures that billboard is compatible with all Rails versions in client
    self.format = :xml
  end
end