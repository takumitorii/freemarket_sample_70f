class CreateProductImages < ActiveRecord::Migration[5.2]
  def change
    create_table :product_images do |t|
      t.string :product_image,   null: false

      t.timestamps
    end
  end
end
