class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price, :precision => 5, :scale => 2
      t.string :image_url

      t.timestamps
    end
  end
end
