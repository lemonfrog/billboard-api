module BillboardApi
  class Queue < ActiveRecord::Base
    serialize :serialized_order
    serialize :serialized_customer
    
    
    # name retry is a keyword in ruby
    def try_again
      customer = self.serialized_customer
      order = self.serialized_order
      order.customer_id = customer.id # ID from Billboard
      
      order.save # request to billboard
    end
  end
end