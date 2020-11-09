class AddDetailsToBoats < ActiveRecord::Migration[6.0]
  def change
    add_column :boats, :price, :integer
    add_column :boats, :name, :string
  end
end
