class Restaurant < ::ApplicationRecord
  belongs_to :user

  has_many :meal_boxes,
           dependent: :destroy

  has_many :customers,
           dependent: :destroy
end
