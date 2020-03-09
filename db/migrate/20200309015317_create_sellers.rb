class CreateSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :sellers do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :shipping_info_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
