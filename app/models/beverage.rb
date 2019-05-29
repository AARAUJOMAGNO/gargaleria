class Beverage < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :name, presence: true
  validates :price, presence: true
  validates :stock, presence: true
  validates :genre, presence: true, inclusion: { in: %w(cerveja cachaça) }
  validates :category, presence: true
  validates :brand, presence: true

  mount_uploader :photo, PhotoUploader
end
