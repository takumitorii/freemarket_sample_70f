class CreateShippingInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_infos do |t|
      t.integer :shipping_cost,   null: false
      t.string  :shipping_area,   null: false
      t.integer :shipping_days,   null: false
      t.integer :seller_id,     null: false

      t.timestamps
    end
  end
end
