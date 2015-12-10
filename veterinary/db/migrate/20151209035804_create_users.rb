class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :type

      t.timestamps null: false
    end

    Owner.create!(name: 'owner')	
    Receptionist.create!(name: 'receptionist')
  end
end
