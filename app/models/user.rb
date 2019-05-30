class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :terms, acceptance: true
  has_many :beverages, dependent: :destroy
  has_many :orders

  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :global_search,
                  against: [:name, :genre, :category, :brand],
                  using: {
                    tsearch: { prefix: true }
                  }
end
