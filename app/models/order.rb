class Order < ApplicationRecord
  belongs_to :shipping_mode

  validates :name, presence: true
  validates :email, presence: true
  validates :address, presence: true
end
