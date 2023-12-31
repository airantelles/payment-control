require 'rails_helper'

RSpec.describe "Invoices", type: :request do
  let(:customer) { create(:customer) }
  let(:invoice_type) { create(:invoice_type) }
  # let(:invoice) { create(:invoice) }

  describe '#index' do
    it "should render index page" do
      get '/invoices'
      expect(response).to render_template :index
    end
    it 'assigns invoices' do
      FactoryBot.create :invoice
      get '/invoices'
      expect(assigns(:invoices)).to eq(Invoice.all)
    end
  end

  describe '#new ' do 
    it 'render :new' do
      new_invoice_type = FactoryBot.build :invoice_type
      get "/invoices/new"
      expect(response).to render_template(:new)
    end
  end 
  
end
