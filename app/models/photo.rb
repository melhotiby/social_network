class Photo < ActiveRecord::Base
  attr_accessible :photo_file, :user_id, :name, :remote_photo_url

  belongs_to :user
  mount_uploader :photo, PhotoUploader
end
