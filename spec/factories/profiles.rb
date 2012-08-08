# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    dob "1975-02-03 11:41:34"
    gender "MyString"
    age 1
    hair_color "MyString"
    nationality "MyString"
    education "MyString"
    religion "MyString"
    religious_values "MyString"
    country "United States"
    city "Charlotte"
    state_or_providence "North Carolina"
  end
end
