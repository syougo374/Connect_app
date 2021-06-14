class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorites_users, through: :favorites, source: :user
  scope :search_address, -> (search_address) {where("title LIKE ?", "%#{search_title}%") }

  validates :content, presence: true, length:{ maximum: 255 }
  validates :title, presence: true, length:{ maximum: 30 }
  validates :address, presence:true, length:{ maximum: 50}

  #--google_map
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode
end
