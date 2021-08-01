class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.datetime :start_date
      t.date :end_date
      t.integer :num_people

      t.timestamps
    end
  end
end
