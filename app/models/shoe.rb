class Shoe < ApplicationRecord
  belongs_to :user
  has_many :shoe_categories
  has_many :categories, through: :shoe_categories
  has_many :shoe_order
  has_many :orders, through: :shoe_orders

  has_one_attached :photo

  validates :name, :price, :description, :stock, :brand, :size, presence: true

  # Create array with categories names
  def categories_to_csv
    categories.map { |category| category.name }.join(", ")
  end

  # Create array with orders id
  def orders_to_csv
    orders.map { |order| order.id}.join(", ")
  end

end
