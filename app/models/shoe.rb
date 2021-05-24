class Shoe < ApplicationRecord
  belongs_to :user
  has_many :shoe_categories
  has_many :categories, through: :shoe_categories
  has_many :shoe_order
  has_many :orders, through: :shoe_orders

  has_one_attached :photo

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :stock, presence: true
  validates :brand, presence:true
  validates :size, presence:true

  def categories_to_csv
    categories.map { |category| category.name }.join(", ")
  end

  def orders_to_csv
    orders.map { |order| order.id}.join(", ")
  end

end
