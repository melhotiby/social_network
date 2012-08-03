# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :match do
    miles_from ""
    gender "MyString"
    age 1
    hair_color "MyString"
    nationality "MyString"
    education "MyString"
    religion "MyString"
    religious_values "MyString"
    about_them "MyText"
  end
end
