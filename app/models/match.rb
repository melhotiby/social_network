class Match < ActiveRecord::Base
  attr_accessible :about_them, :age, :education, :gender, :hair_color, :miles_from, :nationality, :religion, :religious_values
  belongs_to :user
end
