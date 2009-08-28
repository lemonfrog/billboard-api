module BillboardApi
  class Order < ActiveResource::Base
    
    # Create an URL which can be used to redirect the client to paypal.
    # It will include information about the order (id), amount, currency and so on.
    # Some options can be overriden by using the options hash.
    #  * paypal_notify_url
    #  * paypal_receiver_email
    #  * return_after_payment_url
    # 
    def paypal_url(options = {})
       values = {
         :business => BillboardApi::Config.instance.paypal_receiver_email(options[:paypal_receiver_email]),
         :return => BillboardApi::Config.instance.return_after_payment_url(options[:return_after_payment_url]),
         :invoice => "#{self.business_id}_#{self.id}",
         :cmd => '_cart',
         :upload => 1,
         :currency_code => self.currency,
       }
       values[:notify_url] = BillboardApi::Config.instance.paypal_notify_url(options[:paypal_notify_url])

       self.line_items_attributes.each_with_index do |line_item, index|
         values.merge!({
           "amount_#{index + 1}" => "%0.2f" % line_item.price_francs.to_f,
           "item_name_#{index + 1}" => line_item.description,
           "item_number_#{index + 1}" => line_item.id,
           "quantity_#{index + 1}" => line_item.amount
         })
       end

       unless self.vat_total == 0
         values.merge!({
           "amount_#{self.line_items.size + 1}" => "%0.2f" % (self.vat_total.to_f / 100),
           "item_name_#{self.line_items.size + 1}" => "MwSt.",
           "quantity_#{self.line_items.size + 1}" => 1
         })
       end
       
       "#{BillboardApi::Config.instance.paypal_service_url}?#{values.to_query}"
     end
  end
end