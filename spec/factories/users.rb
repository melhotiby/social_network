# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email                  { Faker::Internet.email }
    first_name             { Faker::Name.first_name }
    last_name              { Faker::Name.last_name }
    password               { 'TarXlrOPfaokNOzls2U8' }
    password_confirmation  { 'TarXlrOPfaokNOzls2U8' }
    profile                { FactoryGirl.create(:profile) }
  end
end
