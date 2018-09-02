class Order < ApplicationRecord
  belongs_to :shipping_mode, optional: true
  has_many :order_items

  validates :name, presence: true, on: :update
  validates :email, presence: true, on: :update
  validates :address, presence: true, on: :update
  validates :shipping_mode, presence: true, on: :update
end
