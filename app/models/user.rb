class User < ApplicationRecord
  # model association
  has_many :taxes
  has_one :tax_detail

  # validations
  validates_presence_of :name, :email, :hp
end
