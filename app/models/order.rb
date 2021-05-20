class Order < ApplicationRecord
  belongs_to :user
  has_many :shoe_orders, dependent: :destroy
  has_many :orders, through: :shoe_orders
end
