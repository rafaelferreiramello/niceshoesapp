class Blog < ApplicationRecord
    belongs_to :user

    has_one_attached :cover

    validates :title, :author, :post, presence: true

end
