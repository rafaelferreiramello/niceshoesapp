class Blog < ApplicationRecord

    has_one_attached :cover

    validates :title, :author, :post, presence: true

end
