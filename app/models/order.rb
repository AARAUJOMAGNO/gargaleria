class Order < ApplicationRecord
  belongs_to :user
  belongs_to :beverage

  validates :quantity, presence: true
end
