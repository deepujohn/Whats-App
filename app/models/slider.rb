class Slider < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, SliderUploader
  validates :title,:description,:image,presence:true
end
