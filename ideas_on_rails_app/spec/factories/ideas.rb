FactoryBot.define do
  factory :idea do
    title { Faker::Job.title }
    description { Faker::Job.field  }
    
  end
end
