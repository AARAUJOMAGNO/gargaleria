class Order < ApplicationRecord
  belongs_to :user
  belongs_to :beverage

  validates :quantity, presence: true
  validates :status, inclusion: { in: %w[pending canceled finalized shipped] }
end
