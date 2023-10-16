require 'rails_helper'
require 'rspec/rails'

RSpec.describe "/customers", type: :request do
  let(:customer) { create(:customer) }
  let(:invoice_type) { create(:invoice_type) }

  context "Get customers" do
    describe '#show' do
      it 'should return the customer with given id' do
        get '/customers/1'
        customer_response = assigns(:customer)
        expect(customer_response.name).to eql(customer.name)
        expect(customer_response.day).to eql(customer.day)
      end
    end

    describe '#index' do
      it "should render index page" do
        get '/customers'
        expect(response).to render_template :index
      end
      it 'assigns customers' do
        get '/customers'
        expect(assigns(:customers).last.name).to eq(customer.name)
        expect(assigns(:customers).last.day).to eq(customer.day)
      end
    end

    describe '#create success' do
      it 'render :create success' do
        new_customer = create(:customer, custom_name: "Customer test create", custom_day: 15, invoice_type: invoice_type)
        post "/customers", params: {
          customer: {
            name: new_customer.name,
            day: new_customer.day,
            invoice_type_id: invoice_type.id
          }
        }
        customer = JSON.parse(response.body)
        expect(new_customer.name).to eq(customer["name"])
        expect(new_customer.day).to eq(customer["day"])
        expect(new_customer.invoice_type_id).to eq(customer["invoice_type_id"])
      end
    end
    
    describe '#create error' do
      it 'render :create error' do
        post "/customers", params: {
          customer: {
            name: "Test error",
          }
        }
        customer = JSON.parse(response.body)
        expect("Day can't be blank").to eq(customer["errors"][0])
        expect("Invoice type can't be blank").to eq(customer["errors"][1])
      end
    end
    
    describe '#new ' do 
      it 'render :new' do
        new_customer = FactoryBot.build :customer
        get "/customers/new", params: {
          customer: {
            id: new_customer.id,
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
        new_customer = FactoryBot.create :customer
        get "/customers/#{new_customer.id}/edit", params: {
          id: new_customer.id
        }
        expect(response).to render_template(:edit)
      end
    end

    describe '#update success' do
      it 'render :update success' do
        new_customer = FactoryBot.create :customer
        patch "/customers/#{new_customer.id}", params: { 
          customer: { 
            name: 'Customer test new name' 
          }, 
          id: new_customer.id 
        }
        expect(response).to redirect_to @customer
      end
    end
    
    describe '#update error' do 
      it 'render :update error' do
        patch "/customers/#{99}", params: {
          id: 99,
          customer: {
            error: true,
          }
        }
        customer = JSON.parse(response.body)
        expect("Record not found").to eq(customer["errors"])
      end
    end
    
    describe '#destroy success' do
      it 'destroys success the customer and redirects to customers_path' do
        customer = create(:customer)
        delete customer_path(customer)
        expect { customer.reload }.to raise_error(ActiveRecord::RecordNotFound)
        expect(response).to redirect_to customers_path
      end
    end
    
    describe '#destroy error' do 
      it 'render :destroy error' do
        delete "/customers/#{99}"
        customer = JSON.parse(response.body)
        expect("Record not found").to eq(customer["errors"])
      end
    end

  end
end