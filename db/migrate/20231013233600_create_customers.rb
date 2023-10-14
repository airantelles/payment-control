class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name, limit: 40
      t.integer :day
      t.integer :invoice_type_id
      t.timestamps
    end
  end
end
