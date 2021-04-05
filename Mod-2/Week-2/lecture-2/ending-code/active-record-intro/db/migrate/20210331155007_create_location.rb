class CreateLocation < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :country
      t.string :farm
      t.boolean :fair_trade

      t.timestamps
    end


  end
end
