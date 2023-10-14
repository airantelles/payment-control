class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.integer :customer_id
      t.date :event_date
      t.text :logs
      t.boolean :success
      t.timestamps
    end
    add_foreign_key :invoices, :customers
  end
end
