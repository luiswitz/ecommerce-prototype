class Order < ApplicationRecord
  belongs_to :shipping_mode, optional: true
  has_many :order_items
  has_many :products, through: :order_items

  validates :name, presence: true, on: :update
  validates :email, presence: true, on: :update
  validates :address, presence: true, on: :update
  validates :shipping_mode, presence: true, on: :update

  def total_products_price
    total = 0
    order_items.each do |order_item|
      total = total + order_item.total_price
    end
    total
  end
end
