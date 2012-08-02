class Profile < ActiveRecord::Base
  attr_accessible :about_me, :age, :dob, :education, :gender, :hair_color, :nationality, :religion, :religious_values, :country
  belongs_to :user
  validates :gender, presence: true
end
