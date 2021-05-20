class Shoe < ApplicationRecord
  belongs_to :user
  has_many :shoe_categories
  has_many :categories, through: :shoe_categories
  has_many :shoe_order
  has_many :orders, through: :shoe_orders

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
