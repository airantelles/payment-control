class InvoiceType < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }
end
