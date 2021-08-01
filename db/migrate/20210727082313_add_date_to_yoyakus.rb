class AddDateToYoyakus < ActiveRecord::Migration[6.1]
  def change
    add_column :yoyakus, :start_date, :date

    add_column :yoyakus, :finish_date, :date
  end
end
