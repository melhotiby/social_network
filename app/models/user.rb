class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :profile_attributes
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  validates :first_name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  has_many :interests, dependent: :destroy
  has_many :interested_users, through: :reverse_interests, source: :user
  has_many :interesting_users, through: :interests, source: :interesting
  has_many :messages, class_name: "Comment", foreign_key: "user_id"
  has_many :reverse_interests, foreign_key: "interesting_id",
                                   class_name:  "Interest",
                                   dependent:   :destroy

  acts_as_commentable
  has_secure_password
  HAIRCOLORS = ["black", "brown", "blonde"]
  NATIONALITY = ["White", "Black", "Hispanic"]
  EDUCATION = ["High School", "Some College", "College Graduate", "Masters", "PHD"]
  RELIGION = ["Christian"]

  def show_interest!(other_user)
    interests.create!(interesting_id: other_user.id)
  end

  def remove_interest!(other_user)
    interests.find_by_interesting_id(other_user.id).destroy
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
