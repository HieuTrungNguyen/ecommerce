class Product < ApplicationRecord
  belongs_to :category

  has_many :order_details
  has_many :reviews

  validates :name, presence: true, length: {maximum: Settings.product.name_length}
  validates :price, :quantity, :image, presence: true
end
