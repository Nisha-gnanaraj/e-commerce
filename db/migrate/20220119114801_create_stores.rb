class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :price
      t.integer :offer_price
      t.string :product_image
      t.text :description

      t.timestamps
    end
  end
end
