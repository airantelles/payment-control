class InvoiceTypesController < ApplicationController
  before_action :set_invoice_type, only: [:edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only:[:index, :create, :update,:destroy]

  def index
    @invoice_types = InvoiceType.all
  end
  
  def show
    @invoice_type = InvoiceType.find(params[:id])
  end
  
  def new
    @invoice_type = InvoiceType.new
  end

  def create
    @invoice_type = InvoiceType.new(invoice_type_params)
    if @invoice_type.save
      render json: @invoice_type, status: :created
    else
      render json: { errors: @invoice_type.errors.full_messages }
    end
  end

  def update
    if @invoice_type
      @invoice_type.update(invoice_type_params)
      redirect_to @invoice_type, notice: 'InvoiceType was successfully updated.'
    else
      render json: { errors: "Record not found" }
    end
  end
  
  def edit
  end

  private

  def set_invoice_type
    @invoice_type = InvoiceType.find_by(id: params[:id])
  end

  def invoice_type_params
    params.require(:invoice_type).permit(:name)
  end
end
