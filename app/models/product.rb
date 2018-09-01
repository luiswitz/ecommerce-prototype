class Product < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 0 }
end
