class Product < ApplicationRecord
  attr_accessor :quantity_in_cart

  belongs_to :category
  has_many :order_details
  has_many :reviews

  validates :name, presence: true, length: {maximum: Settings.product.name_length}
  validates :price, :quantity, :image, presence: true

  scope :load_product_by_ids, -> product_ids {where id: product_ids}
  scope :load_product, ->{where "quantity > ?", 0}
  scope :order_by_id, ->{order id: :desc}
  scope :find_by_name, -> name{where("name LIKE ?", "%#{name}%") if name.present?}
  scope :load_product_by_category, -> category_id{where("category_id = ?", category_id)}
end
