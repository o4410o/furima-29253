class UserDonation

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :street_number, :building, :phone_number

end