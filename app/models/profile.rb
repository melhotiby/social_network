class Profile < ActiveRecord::Base
  attr_accessible :about_me, :dob, :education, :gender, :hair_color, :nationality, :religion, :religious_values, :country, :lat, :long, :state_or_providence, :city
  belongs_to :user
  validates :gender, presence: true
  validates :state_or_providence, presence: true
  validates :country, presence: true
  validates :dob, presence: true
  paginates_per 20
  before_save :generate_lat_long
  before_update :generate_lat_long

  def age
    now = Time.now.utc.to_date
    now.year - self.dob.year - ((now.month > self.dob.month || (now.month == self.dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  searchable do
    integer :age
    string :education
    string :gender
    string :nationality
    string :city
    string :country
    time :created_at
  end

  protected

    def generate_lat_long
      require 'geo'
      lat, lng = Geo::get_coords("#{self.state_or_providence} #{self.city} #{self.country}")
      self.lat = lat
      self.long = lng
    end
end
