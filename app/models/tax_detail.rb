class TaxDetail < ApplicationRecord
  # model association
  belongs_to :user

  # validation
  validates_presence_of :total_amount
  validates_presence_of :total_tax_amount
  validates_presence_of :grand_total
end
