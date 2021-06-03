class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user

  scope :search_address, -> (search_address) {where("title LIKE ?", "%#{search_title}%") }
end
