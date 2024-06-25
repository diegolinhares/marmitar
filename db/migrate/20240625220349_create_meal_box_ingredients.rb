class CreateMealBoxIngredients < ActiveRecord::Migration[7.2]
  def change
    create_table :meal_box_ingredients do |t|
      t.references :meal_box, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
