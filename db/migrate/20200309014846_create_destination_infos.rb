class CreateDestinationInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :destination_infos do |t|
      t.user_id :integer,           null: false, foreign_key: true
      t.string :family_name,        null: false
      t.string :first_name,         null: false
      t.string :family_name_kana,   null: false
      t.string :first_name_kana,    null: false
      t.string :post_cpde,          null: false
      t.string :prefecture,         null: false
      t.string :city,               null: false
      t.string :adress,             null: false
      t.string :building_name
      t.string :phone_number
      t.timestamps
    end
  end
end