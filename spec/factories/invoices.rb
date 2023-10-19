FactoryBot.define do
  factory :invoice do
    event_date { '2023-10-18' }
    success { true }
    association :customer
  end
end