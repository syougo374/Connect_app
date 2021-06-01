class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable, :omniauthable
end
