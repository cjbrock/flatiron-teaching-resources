class CreateTourists < ActiveRecord::Migration[6.0]
  def change
    create_table :tourists do |t|
      t.string :name
      t.string :hometown
      t.boolean :ticket_paid
      t.belongs_to :tour, null: false, foreign_key: true

      t.timestamps
    end
  end
end
