class Item < ApplicationRecord
 
 
  with_options presence: true do
    validates :item_name
    validates :price
    validates :detail
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :shipping_area_id
    validates :shipping_date_id
    
  end
end
