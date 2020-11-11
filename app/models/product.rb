class Product < ApplicationRecord
  belongs_to :category
  validates :name, :price, :description, :sale, :priceonsale, presence: true
  has_one_attached :image
end
