class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image,   null: false
      t.integer :product_id, foreign_key: true
      t.timestamps
    end
  end
end
