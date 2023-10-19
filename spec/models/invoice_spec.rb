require 'rails_helper'

RSpec.describe Invoice, type: :model do
    let(:customer) { create(:customer) }
    let(:invoice_type) { create(:invoice_type) }
    let(:invoice) { create(:invoice) }

  it "is valid with valid attributes" do
    invoice = Invoice.new(
      customer: customer,
      invoice_type: invoice_type,
      event_date: Date.today,
      logs: nil,
      success: true
    )
    expect(invoice).to be_valid
  end

  it "is not valid without an event_date" do
    invoice = Invoice.new(
      customer: customer,
      invoice_type: invoice_type,
      logs: "Logs",
      success: true
    )
    expect(invoice).to_not be_valid
  end

  it "is valid without logs" do
    invoice = Invoice.new(
      customer: customer,
      invoice_type: invoice_type,
      event_date: Date.today,
      success: true
    )
    expect(invoice).to be_valid
  end

  it "is not valid without a valid success value" do
    invoice = Invoice.new(
      customer: customer,
      invoice_type: invoice_type,
      event_date: Date.today,
      logs: "Logs",
      success: nil
    )
    expect(invoice).to_not be_valid
  end

  it "is valid with a true success value" do
    invoice = Invoice.new(
      customer: customer,
      invoice_type: invoice_type,
      event_date: Date.today,
      logs: "Logs",
      success: true
    )
    expect(invoice).to be_valid
  end

  it "is valid with a false success value" do
    invoice = Invoice.new(
      customer: customer,
      invoice_type: invoice_type,
      event_date: Date.today,
      logs: "Logs",
      success: false
    )
    expect(invoice).to be_valid
  end

  it "belongs to a customer" do
    association = described_class.reflect_on_association(:customer)
    expect(association.macro).to eq :belongs_to
  end
end