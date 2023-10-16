require 'rails_helper'

RSpec.describe "Invoices", type: :request do
  describe '#index' do
    it "should render index page" do
      get '/invoices'
      expect(response).to render_template :index
    end
    it 'assigns invoices' do
      new_invoice = FactoryBot.create :invoice
      get '/invoices'
      expect(Invoice.first).to eq(new_invoice)
    end
  end
end
