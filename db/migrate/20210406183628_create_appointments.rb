class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :city
      t.datetime :appointment_date
      t.belongs_to :user
      t.belongs_to :car

      t.timestamps
    end
  end
end
