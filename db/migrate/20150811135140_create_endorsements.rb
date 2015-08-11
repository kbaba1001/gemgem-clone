class CreateEndorsements < ActiveRecord::Migration
  def change
    create_table :endorsements do |t|
      t.references :user, index: true, foreign_key: true
      t.references :thing, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
