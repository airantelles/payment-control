class CustomersController < ApplicationController
  before_action :set_customer, only: [:edit, :update, :destroy]
  before_action :set_invoice_type_and_days, only: [:edit, :new, :create]
  skip_before_action :verify_authenticity_token, only:[:index, :create, :update,:destroy]

  def index
    @customers = Customer.all
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_url, notice: 'Customer was successfully created.'
    else
      flash[:class] = "is-invalid"
      flash[:error] = @customer.errors.full_messages.to_sentence
      redirect_to new_customer_path
    end
  end

  def update
    if @customer
      @customer.update(customer_params)
      redirect_to customers_url, notice: 'Customer was successfully created.'
    else
      flash[:class] = "is-invalid"
      flash[:error] = @customer.errors.full_messages.to_sentence
      redirect_to new_customer_path
    end
  end
  
  def edit
  end

  def destroy
    if @customer
      @customer.destroy
      redirect_to customers_url, notice: 'Customer was successfully destroyed.'
    else
      render json: { errors: "Record not found" }
    end
  end

  private

  def set_customer
    @customer = Customer.find_by(id: params[:id])
  end
  
  def set_invoice_type_and_days
    @invoice_types = InvoiceType.all
    @days = (1..28).to_a
  end

  def customer_params
    params.require(:customer).permit(:name, :day, :invoice_type_id)
  end
end