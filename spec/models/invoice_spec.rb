require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it { should respond_to(:customer) }
  it { should respond_to(:merchant) }
  it { should have_many(:transactions) }
  it { should have_many(:invoice_items) }
  it { should have_many(:items).through(:invoice_items) }
end
