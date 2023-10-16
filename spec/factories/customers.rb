FactoryBot.define do
  factory :customer do
    name { "Customer Test" }
    day { 10 }
    association :invoice_type
    
    transient do
      custom_name { nil }
      custom_day { nil }
      custom_invoice_type { nil }
    end
    before(:create) do |customer, evaluator|
      customer.name = evaluator.custom_name || customer.name
      customer.day = evaluator.custom_day || customer.day
      customer.invoice_type = evaluator.custom_invoice_type || customer.invoice_type
    end
  end
end