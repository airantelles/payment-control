class AddInvoiceTypeToInvoice < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :invoice_type_id, :integer, null: false
    add_foreign_key :invoices, :invoice_types, column: :invoice_type_id
  end
end
