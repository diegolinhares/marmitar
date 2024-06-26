class Customer < ::ApplicationRecord
  belongs_to :restaurant

  has_many :orders, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :phone, uniqueness: true
  end

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
