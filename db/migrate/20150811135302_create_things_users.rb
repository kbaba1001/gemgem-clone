class CreateThingsUsers < ActiveRecord::Migration
  def change
    create_table :things_users, id: false do |t|
      t.references :thing, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
