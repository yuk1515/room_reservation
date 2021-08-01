class AddfinDateToreservation < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :fin_date, :datetime
  end
end
