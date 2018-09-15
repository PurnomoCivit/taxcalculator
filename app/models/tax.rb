class Tax < ApplicationRecord
  # model association
  belongs_to :user

  # validation
  validates_presence_of :name
  validates_presence_of :tax_code
  validates_presence_of :amount
end
