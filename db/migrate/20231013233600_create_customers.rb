class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name, limit: 40, null: false
      t.integer :day, null: false
      t.integer :invoice_type_id, null: false
      t.timestamps
    end
  end
end
