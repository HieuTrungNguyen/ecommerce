class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items

  validates :customer_name, presence: true, length: {maximum: Settings.name.length}
  validates :customer_phone, :customer_address, :customer_city,
    :customer_country, presence: true

  scope :newest, ->{order(created_at: desc)}
end
