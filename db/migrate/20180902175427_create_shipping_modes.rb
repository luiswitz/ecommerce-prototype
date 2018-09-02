class CreateShippingModes < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_modes do |t|
      t.string :title
      t.decimal :price, :precision => 5, :scale => 2

      t.timestamps
    end
  end
end
