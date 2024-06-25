class MealBox < ::ApplicationRecord
  belongs_to :restaurant

  has_many :meal_box_ingredients, dependent: :destroy
  has_many :ingredients, through: :meal_box_ingredients

  has_many :meal_box_availabilities, dependent: :destroy
  has_many :availabilities,
           class_name: "::MealBoxAvailability",
           foreign_key: "meal_box_id",
           dependent: :destroy

  monetize :price_cents, with_model_currency: :currency

  def formatted_price = price.format
end
