class Photo < ActiveRecord::Base
  attr_accessible :photo, :user_id, :name

  belongs_to :user
  mount_uploader :photo, PhotoUploader
end
