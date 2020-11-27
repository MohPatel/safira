class Customer < ApplicationRecord
  belongs_to :province
  belongs_to :user
  has_many :orders
  validates :name, :email, :address, presence: true
end
