class AddInvoiceTypeToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :customers, :invoice_types
  end
end
