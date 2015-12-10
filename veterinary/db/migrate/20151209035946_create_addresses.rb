class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :degree_from
      t.integer :experience
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
