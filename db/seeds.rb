# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

invoice_types = InvoiceType.create(
  [
    { name: "Cartão de crédito"}, 
    { name: "Boleto"},
    { name: "Débito Automático"}
  ]
)

customers = Customer.create(
  [
    {name: "Usuário 1", day: 13, invoice_type_id: invoice_types[0].id},
    {name: "Usuário 2", day: 17, invoice_type_id: invoice_types[1].id},
    {name: "Usuário 3", day: 16, invoice_type_id: invoice_types[2].id},
    {name: "Usuário 4", day: 19, invoice_type_id: invoice_types[1].id},
    {name: "Usuário 5", day: 20, invoice_type_id: invoice_types[0].id},
    {name: "Usuário 6", day: 25, invoice_type_id: invoice_types[2].id}
  ]
)

Invoice.create(
  [
    {
      customer_id: customers[0].id,
      invoice_type: customers[0].invoice_type,
      event_date: '2023-10-13',
      logs: nil,
      success: true
    },
    {
      customer_id: customers[1].id,
      invoice_type: customers[1].invoice_type,
      event_date: '2023-10-17',
      logs: 'Error processing invoice',
      success: false
    },
    {
      customer_id: customers[2].id,
      invoice_type: customers[2].invoice_type,
      event_date: '2023-10-16',
      logs: nil,
      success: true
    },
    {
      customer_id: customers[3].id,
      invoice_type: customers[3].invoice_type,
      event_date: '2023-09-19',
      logs: nil,
      success: true
    },
    {
      customer_id: customers[4].id,
      invoice_type: customers[4].invoice_type,
      event_date: '2023-09-20',
      logs: 'Error processing invoice',
      success: false
    },
    {
      customer_id: customers[5].id,
      invoice_type: customers[5].invoice_type,
      event_date: '2023-09-25',
      logs: 'Error processing invoice',
      success: true
    }
  ]
)