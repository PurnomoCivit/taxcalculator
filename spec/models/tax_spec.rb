require 'rails_helper'

RSpec.describe Tax, type: :model do
  # Association test
  # ensure an tax record belongs to a single user record
  it { should belong_to(:user) }
  # Validation test
  # ensure column name, tax_code and amount is present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:tax_code) }
  it { should validate_presence_of(:amount) }
end
