class Photo < ActiveRecord::Base
  attr_accessible :name, :photo, :user_id, :remote_photo_url
  belongs_to :user
  mount_uploader :photo, PhotoUploader
end
