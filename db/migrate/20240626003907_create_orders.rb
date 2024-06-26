class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :meal_box, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.string :status, null: false, default: "pending"
      t.monetize :total_price, currency: { present: true }

      t.timestamps
    end
  end
end
