FactoryBot.define do
  factory :comment do
    content { Faker::Company.catch_phrase }
    project_status { 'active' }
    user
    project
  end
end
