require 'rails_helper'

RSpec.describe InvoiceType, type: :model do
  it "is valid with a valid name" do
    invoice_type = InvoiceType.new(name: "Example Invoice Type")
    expect(invoice_type).to be_valid
  end

  it "is not valid without a name" do
    invoice_type = InvoiceType.new(name: nil)
    expect(invoice_type).to_not be_valid
  end

  it "is not valid if the name exceeds the maximum length" do
    long_name = "Teste" * 10
    invoice_type = InvoiceType.new(name: long_name)
    expect(invoice_type).to_not be_valid
  end
end
