class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_date
  has_one_attached :item_image

  validates :item_name, :item_image, :price, :detail, :genre, :status, :delivery, :shipping_area, :shipping_date, presence: true
  validates :genre_id, :status_id, :delivery_id, :shipping_area_id, :shipping_date_id, numericality: { other_than: 1 }

  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9_999_999 }
end
