FactoryBot.define do
  factory :invoice do
    event_date { Date.today }
    success { true }
    association :customer
  end
end