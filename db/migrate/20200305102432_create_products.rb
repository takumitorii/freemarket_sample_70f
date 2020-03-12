class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name,                   null: false
      t.string :price,                  null: false
      t.string :description,            null: false
      t.string :status,                 null: false
      t.integer :category_id,           null: false, foreign_key: true
      t.integer :brand_id,              foreign_key: true
      t.integer :seller_id,             null: false, foreign_key: true
      t.integer :shipping_info_id,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
