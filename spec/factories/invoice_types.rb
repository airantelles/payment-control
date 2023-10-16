FactoryBot.define do
  factory :invoice_type do
    name { "Invoice Type Test" }
    
    transient do
      custom_name { nil }
    end
    before(:create) do |customer, evaluator|
      customer.name = evaluator.custom_name || customer.name
    end
  end
end