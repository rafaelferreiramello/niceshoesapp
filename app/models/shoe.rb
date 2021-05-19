class Shoe < ApplicationRecord
  belongs_to :user
  has many :shoe_categories
  has many :categories, through: :shoe_categories
end
