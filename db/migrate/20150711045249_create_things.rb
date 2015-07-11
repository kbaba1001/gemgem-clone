class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :name
      t.text :description
      t.text :image_meta_data

      t.timestamps null: false
    end
  end
end
