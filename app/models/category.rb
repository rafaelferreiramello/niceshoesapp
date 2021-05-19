class Category < ApplicationRecord
    has many :shoe_categories
    has many :shoes, through: :shoe_categories
end
