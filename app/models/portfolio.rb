class Portfolio < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :title,:description,:image,presence:true
end
