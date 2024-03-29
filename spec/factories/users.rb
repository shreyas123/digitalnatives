FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    role { FactoryGirl.create :role }
  end
end