require 'spec_helper'

RSpec.describe Customer, type: :model do
  subject {
    described_class.new(name: "Teste Customer",
                        day: 10,
                        invoice_type: create(:invoice_type),
                      )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid if the name exceeds the maximum length" do
    subject.name = "Customer" * 10
    expect(subject).to_not be_valid
  end

  it "is not valid without a day" do
    subject.day = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a invoice type id" do
    subject.invoice_type_id = nil
    expect(subject).to_not be_valid
  end
end