class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :weight
      t.integer :deleted
      t.references :thing, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
