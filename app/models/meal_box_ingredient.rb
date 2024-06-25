class MealBoxIngredient < ::ApplicationRecord
  belongs_to :meal_box
  belongs_to :ingredient
end
