class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.string  :cost,          null: false
      t.string  :prefecture_id, null: false
      t.string  :days,          null: false
      t.integer :user_id,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
