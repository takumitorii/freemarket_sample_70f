class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.integer :user_id,          null: false, foreign_key: true
      t.string :security_code,     null: false
      t.string :card_number,       null: false
      t.string :expiration_year,   null: false
      t.string :expiration_month,  null: false

      t.timestamps
    end
  end
end
