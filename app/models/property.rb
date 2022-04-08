class Property < ApplicationRecord
  validates :address, presence: true
  validates :size, presence: true
  validates :price, presence: true
end
