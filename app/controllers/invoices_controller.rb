class InvoicesController < ApplicationController
  skip_before_action :verify_authenticity_token, only:[:index]

  def index
    @invoices = Invoice.all
  end
  
  def new
    @invoice_type = InvoiceType.new
  end
end
