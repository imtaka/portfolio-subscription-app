FactoryBot.define do
  factory :post do
    subscription_name { "MyString" }
    description { "MyText" }
    monthly_price { 1 }
    trial_term { 1 }
    url { "MyString" }
  end
end
