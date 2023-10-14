class CreateInvoiceTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :invoice_types do |t|
      t.string :name, limit: 40, null: false
      t.timestamps
    end
  end
end
