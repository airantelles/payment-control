require 'rails_helper'

RSpec.describe "InvoiceTypes", type: :request do
  let(:customer) { create(:customer) }
  let(:invoice_type) { create(:invoice_type) }

  context "Get invoice_types" do
    describe '#show' do
      it 'should return the invoice_type with given id' do
        get '/invoice_types/1'
        invoice_type_response = assigns(:invoice_type)
        expect(invoice_type_response.name).to eql(invoice_type.name)
      end
    end

    describe '#index' do
      it "should render index page" do
        get '/invoice_types'
        expect(response).to render_template :index
      end
      it 'assigns invoice_types' do
        get '/invoice_types'
        expect(assigns(:invoice_types).last.name).to eq(invoice_type.name)
      end
    end

    describe '#create success' do
      it 'render :create success' do
        new_invoice_type = create(:invoice_type, custom_name: "Customer test create")
        post "/invoice_types", params: {
          invoice_type: {
            name: new_invoice_type.name,
          }
        }
        invoice_type = JSON.parse(response.body)
        expect(new_invoice_type.name).to eq(invoice_type["name"])
      end
    end
    
    describe '#create error' do
      it 'render :create error' do
        post "/invoice_types", params: {
          invoice_type: {
            error: "Test error",
          }
        }
        invoice_type = JSON.parse(response.body)
        expect("Name can't be blank").to eq(invoice_type["errors"][0])
      end
    end
    
    describe '#new ' do 
      it 'render :new' do
        new_invoice_type = FactoryBot.build :invoice_type
        get "/invoice_types/new", params: {
          invoice_type: {
            id: new_invoice_type.id,
            name: 'Customer test',
            day: 16,
            invoice_type: invoice_type
          }
        }
        expect(response).to render_template(:new)
      end
    end 

    describe '#edit' do 
      it 'render :edit' do
        new_invoice_type = FactoryBot.create :invoice_type
        get "/invoice_types/#{new_invoice_type.id}/edit", params: {
          id: new_invoice_type.id
        }
        expect(response).to render_template(:edit)
      end
    end

    describe '#update success' do
      it 'render :update success' do
        new_invoice_type = FactoryBot.create :invoice_type
        new_name = "Edit Sucess"
        patch "/invoice_types/#{new_invoice_type.id}", params: { 
          invoice_type: { 
            name: new_name
          }, 
          id: new_invoice_type.id 
        }
        expect(InvoiceType.find_by(id: new_invoice_type.id).name).to eq(new_name)
      end
    end
    
    describe '#update error' do 
      it 'render :update error' do
        invalid_params = { name: "" }
        patch "/invoice_types/#{invoice_type.id}/", params: { id: invoice_type.id, invoice_type: invalid_params }
        expect(response).to redirect_to(edit_invoice_type_path(invoice_type))
        expect(flash[:class]).to eq("is-invalid")
        expect(flash[:errors]).to be_present
        expect(flash[:errors].full_messages).to include("Name can't be blank")
      end
    end
  end
end
