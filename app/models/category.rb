class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.category.name_length}
end
