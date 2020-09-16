class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_date

  validates :item_name, :price, :detail, :genre, :status, :delivery, :shipping_area, :shipping_date, presence: true
  validates :genre_id, :status_id, :delivery_id, :shipping_area_id, :shipping_date_id, numericality: { other_than: 1 } 

end
