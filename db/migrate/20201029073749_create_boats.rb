class CreateBoats < ActiveRecord::Migration[6.0]
  def change
    create_table :boats do |t|
      t.string :image, null: false
      t.string :description, null: false
      t.integer :brand_id, null: false
      t.integer :size_id, null: false
      t.timestamps
    end
  end
end
