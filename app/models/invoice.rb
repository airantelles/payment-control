class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :invoice_type

  validates :event_date, presence: true
  validates :success, inclusion: { in: [true, false] }, allow_nil: false
end
