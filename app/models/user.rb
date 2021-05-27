class User < ApplicationRecord
  rolify
  has_many :shoes
  has_many :orders
  has_many :blogs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
