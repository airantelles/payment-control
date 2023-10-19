class Customer < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }
  validates :day, presence: true
  validates :invoice_type_id, presence: true

  belongs_to :invoice_type
  has_many :invoices
end
