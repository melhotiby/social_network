require 'spec_helper'

describe User do

  before do
    user = FactoryGirl.create(:user)
  end

  it { should respond_to(:email) }
  it { should respond_to(:first_name) }
  it { should respond_to(:first_name) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:profile) }
  it { should have_one(:profile).dependent(:destroy) }
  it { should have_one(:match).dependent(:destroy) }
  it { should accept_nested_attributes_for :profile }
  it { should validate_presence_of(:first_name) }
  it { should ensure_length_of(:first_name).is_at_most(50) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of(:password) }
  it { should ensure_length_of(:password).is_at_least(6) }
  it { should validate_presence_of(:password_confirmation) }
  it { should have_many(:photos) }
  it { should have_many(:interests).dependent(:destroy) }
  it { should have_many(:interested_users).through(:reverse_interests) }
  it { should have_many(:messages) }
  it { should have_many(:reverse_interests).dependent(:destroy) }


  context "#before_filter" do
    let(:user) { FactoryGirl.create(:user, email: "MYRANDOM@GMAIL.com") }
    it "should downcase the email" do
      user.email.should eq("myrandom@gmail.com")
      user.email.should_not eq("MYRANDOM@GMAIL.com")
    end
  end

  context "#create_remember_token" do
    let(:user) { FactoryGirl.create(:user) }
    it "should create a random remember token" do
      user.remember_token.should_not be_nil
    end
  end
end
