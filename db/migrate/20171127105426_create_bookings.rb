class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.text :description
      t.datetime :date_in
      t.datetime :date_out

      t.timestamps
    end
  end
end
