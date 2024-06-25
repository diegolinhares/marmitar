class CreateMealBoxes < ::ActiveRecord::Migration[7.2]
  def change
    create_table :meal_boxes do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.string :name, null: false
      t.string :description
      t.monetize :price, currency: { present: true }

      t.timestamps
    end

    add_index :meal_boxes, :name, unique: true
  end
end
