class Order < ApplicationRecord
  belongs_to :user
  has_many :shoe_orders
  has_many :shoes, through: :shoe_orders

  validates :total_ammount, presence: true
  
end
