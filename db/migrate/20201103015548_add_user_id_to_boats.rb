class AddUserIdToBoats < ActiveRecord::Migration[6.0]
  def change
    add_column :boats, :user_id, :integer
  end
end
