class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :unit_price, presence: true
  validates :quantity, presence: true

  scope :find_by_order_id, -> order_id{where order_id: order_id}
end
