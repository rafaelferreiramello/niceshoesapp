class Shoe < ApplicationRecord
  belongs_to :user
  has many :shoe_categories
  has many :categories, through: :shoe_categories
  has many :shoe_order
  has many :orders, through: :shoe_orders
end
