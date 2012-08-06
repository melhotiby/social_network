class Profile < ActiveRecord::Base
  attr_accessible :about_me, :dob, :education, :gender, :hair_color, :nationality, :religion, :religious_values, :country, :lat, :long, :state_or_providence, :city
  belongs_to :user
  validates :gender, presence: true
  validates :state_or_providence, presence: true
  validates :city, presence: true
  validates :dob, presence: true

  before_save :generate_lat_long
  before_update :generate_lat_long

  def age
    now = Time.now.utc.to_date
    now.year - self.dob.year - ((now.month > self.dob.month || (now.month == self.dob.month && now.day >= dob.day)) ? 0 : 1)
  end


  protected

    def generate_lat_long
      require 'geo'
      lat, lng = Geo::get_coords("#{self.city} #{self.state_or_providence}")
      self.lat = lat
      self.long = lng
    end
end
