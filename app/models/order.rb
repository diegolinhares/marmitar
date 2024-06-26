class Order < ::ApplicationRecord
  belongs_to :customer
  belongs_to :meal_box


  with_options presence: true do
    validates :name
    validates :phone, uniqueness: true
    validates :status
    validates :quantity, numericality: { greater_than: 0 }
  end

  monetize :total_price_cents, with_model_currency: :currency
end
