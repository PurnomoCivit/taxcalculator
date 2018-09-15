require 'rails_helper'

RSpec.describe TaxDetail, type: :model do
  # Association test
  # ensure an tax record belongs to a single user record
  it { should belong_to(:user) }
  # Validation test
  # ensure column name, taxCode and amount is present before saving
  it { should validate_presence_of(:total_amount) }
  it { should validate_presence_of(:total_tax_amount) }
  it { should validate_presence_of(:grand_total) }
end
