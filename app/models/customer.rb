class Customer < ::ApplicationRecord
  belongs_to :restaurant

  has_many :orders, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :phone, uniqueness: true
  end
end
