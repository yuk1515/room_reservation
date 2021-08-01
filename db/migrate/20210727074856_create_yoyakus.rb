class CreateYoyakus < ActiveRecord::Migration[6.1]
  def change
    create_table :yoyakus do |t|
      t.date :day_r
      t.integer :number_of_people
      t.timestamps
    end
  end
end
