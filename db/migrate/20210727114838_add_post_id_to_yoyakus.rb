class AddPostIdToYoyakus < ActiveRecord::Migration[6.1]
  def change
    add_column :yoyakus, :post_id, :integer
  end
end
