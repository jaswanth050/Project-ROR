class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :visit_date
      t.string :pet
      t.integer :customer_id
      t.boolean :send_reminder
      t.string :reason
      t.integer :doctor_id

      t.timestamps null: false
    end
  end
end
