class InvoicesController < ApplicationController
  skip_before_action :verify_authenticity_token, only:[:index]

  def index
    @invoice_types = InvoiceType.all
  end
end
