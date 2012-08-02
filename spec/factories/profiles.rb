# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    dob "2012-08-02 11:41:34"
    gender "MyString"
    age 1
    hair_color "MyString"
    nationality "MyString"
    education "MyString"
    religion "MyString"
    religious_values "MyString"
    about_me "MyText"
  end
end
