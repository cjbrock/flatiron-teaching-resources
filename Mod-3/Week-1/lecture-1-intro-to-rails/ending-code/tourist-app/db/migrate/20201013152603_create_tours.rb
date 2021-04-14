class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.string :name
      t.string :location
      t.string :activities
      t.float :cost
      t.time :start_time
      t.time :end_time
      t.date :tour_date
      t.boolean :full

      t.timestamps
    end
  end
end
