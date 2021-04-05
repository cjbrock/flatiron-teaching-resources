class AddLoactionIdToCoffees < ActiveRecord::Migration[5.2]
  def change
    add_column :coffees, :location_id, :integer
  end
end
