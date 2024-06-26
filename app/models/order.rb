class Order < ::ApplicationRecord
  belongs_to :customer
  belongs_to :meal_box

  with_options presence: true do
    validates :status
    validates :quantity, numericality: { greater_than: 0 }
  end

  monetize :total_price_cents, with_model_currency: :currency

  enum status: {
    pending: "pending",
    confirmed: "confirmed",
    preparing: "preparing",
    ready_for_pickup: "ready_for_pickup",
    out_for_delivery: "out_for_delivery",
    delivered: "delivered",
    cancelled: "cancelled",
    refunded: "refunded"
  }
end
