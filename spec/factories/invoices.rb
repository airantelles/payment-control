FactoryBot.define do
  factory :invoice do
    event_date { '2023-10-18' }
    success { true }
    logs { nil }
    association :customer
    association :invoice_type
    
    transient do
      custom_customer { nil }
      custom_success { nil }
      custom_logs { nil }
    end
    before(:create) do |invoice, evaluator|
      invoice.customer = evaluator.custom_customer || invoice.customer
      invoice.success = evaluator.custom_success || invoice.success
      invoice.logs = evaluator.custom_logs || invoice.logs
    end
  end
end