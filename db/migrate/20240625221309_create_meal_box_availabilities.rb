class CreateMealBoxAvailabilities < ActiveRecord::Migration[7.2]
  def change
    create_table :meal_box_availabilities do |t|
      t.references :meal_box, null: false, foreign_key: true
      t.integer :day_of_week, null: false

      t.timestamps
    end
  end
end
