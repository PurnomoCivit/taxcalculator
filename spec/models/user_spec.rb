require 'rails_helper'

RSpec.describe User, type: :model do
  # Association test
  # ensure User model has a 1:m relationship with the Tax model
  it { should have_many(:taxes) }
  it { should have_one(:tax_detail) }
  # Validation tests
  # ensure columns name, email and hp are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:hp) }
end
