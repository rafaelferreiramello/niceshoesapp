class Blog < ApplicationRecord

    has_one_attached :cover

    validates :title, presence: true
    validates :author, presence: true
    validates :post, presence: true

end
