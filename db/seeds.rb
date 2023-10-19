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

Customer.create(
  [
    {name: "Usuário 1", day: 13, invoice_type_id: invoice_types[0].id},
    {name: "Usuário 2", day: 17, invoice_type_id: invoice_types[1].id},
    {name: "Usuário 3", day: 16, invoice_type_id: invoice_types[2].id},
    {name: "Usuário 4", day: 19, invoice_type_id: invoice_types[1].id},
    {name: "Usuário 5", day: 20, invoice_type_id: invoice_types[0].id},
    {name: "Usuário 6", day: 25, invoice_type_id: invoice_types[2].id}
  ]
)