class AddColumnYoyakus < ActiveRecord::Migration[6.1]
  def change
    add_column :yoyakus, :user_id, :integer
  end
end
