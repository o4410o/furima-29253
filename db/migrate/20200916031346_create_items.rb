class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string     :item_name,        null: false 
      t.integer    :price,            null: false
      t.text       :detail,           null: false 
      t.references :user,             null: false, foreign_key: true

      t.integer    :genre_id,         null: false
      t.integer    :status_id,        null: false
      t.integer    :delivery_id,      null: false
      t.integer    :shipping_area_id, null: false
      t.integer    :shipping_date_id, null: false
      t.timestamps
    end
  end
end
