class OrderAddress

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :street_number, :building, :phone_number, :token


  with_options presence: true do
    validates :city, :street_number, :prefecture_id, :token

    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone_number, format: { with: /\d{10,11}/ }
    validates :prefecture_id, numericality: { other_than: 1 }
  end
   def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_number: street_number, building: building, phone_number: phone_number, order_id: order.id)
   
   end
end