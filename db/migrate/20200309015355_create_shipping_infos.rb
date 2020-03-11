class CreateShippingInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_infos do |t|
      t.string :shipping_cost,   null: false
      t.string  :shipping_area,   null: false
      t.string :shipping_days,   null: false
      # t.integer :seller_id,     null: false
      # t.integer :product_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
