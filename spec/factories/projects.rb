FactoryBot.define do
  factory :project do
    name { Faker::Company.buzzword }
    status { :active }
  end
end
