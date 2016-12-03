FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.sentence(4) }
    user { FactoryGirl.create(:user) }
  end
end
