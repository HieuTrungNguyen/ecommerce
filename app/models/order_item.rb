class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  scope :find_by_order_id, -> order_id{where order_id: order_id}
end
