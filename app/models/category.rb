class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  accepts_nested_attributes_for :products, allow_destroy: true

  validates :name, presence: true, length: {maximum: Settings.category.name_length}
end
