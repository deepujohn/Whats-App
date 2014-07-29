class Portfolio < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :title,:description,:image,presence:true
  validates_format_of :image, :with => %r{\.(png|jpg|jpeg)}i, message:  "Only jpeg,jpg,png allowed"
end
