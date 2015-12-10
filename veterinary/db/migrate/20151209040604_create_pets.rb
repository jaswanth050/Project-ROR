class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :type_of_pet
      t.string :breed
      t.string :age
      t.string :weight
      t.datetime :last_visit
      t.integer :doctor_id
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
