class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true,
                       numericality: { greater_than_or_equal_to: 1 }

  def total_price
    product.price.to_f * quantity.to_f
  end
end
