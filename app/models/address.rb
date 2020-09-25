class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :order

  with_options presence: true do
    validates :city, :street_number, :prefecture: true

    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone_number, format: { with: /\d{10,11}/ }
    validates :prefectre_id, { other_than: 1}
  end
end
