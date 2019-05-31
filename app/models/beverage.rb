class Beverage < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :genre, presence: true, inclusion: { in: %w(cerveja cachaça) }
  validates :category, presence: true
  validates :brand, presence: true

  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :global_search,
                  against: [:name, :genre, :category, :brand, :description],
                  using: {
                    tsearch: { prefix: true }
                  }
end
