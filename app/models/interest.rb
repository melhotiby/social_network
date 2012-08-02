class Interest < ActiveRecord::Base
  attr_accessible :interesting_id
  belongs_to :user
  belongs_to :interesting, class_name: "User"

  validates :interesting_id, presence: true
  validates :user_id, presence: true
end
