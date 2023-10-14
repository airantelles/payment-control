FactoryBot.define do
  factory :customer do
    name { "Customer Test" }
    day { 10 }
    association :invoice_type
  end
end