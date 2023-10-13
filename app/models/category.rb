class Category < ApplicationRecord

  has_many :products
  validates :name, presence: true #validates category and ensures its not empty or nil 
end
