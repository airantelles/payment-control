class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.integer :customer_id, null: false
      t.date :event_date, null: false
      t.text :logs
      t.boolean :success, null: false
      t.timestamps
    end
    add_foreign_key :invoices, :customers
  end
end
