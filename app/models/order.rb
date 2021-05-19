class Order < ApplicationRecord
  belongs_to :user
  has many :shoe_orders, dependent: :destroy
  has many :orders, through: :shoe_orders
end
