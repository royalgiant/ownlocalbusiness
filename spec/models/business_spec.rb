require 'rails_helper'

describe Business do
  before { @business = FactoryGirl.build(:business) }

  subject { @business }

  it { should respond_to(:uuid) }
  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:zip) }
  it { should validate_numericality_of(:zip) }
  it { should respond_to(:country) }
  it { should respond_to(:phone) }
  it { should validate_numericality_of(:phone) }
  it { should respond_to(:website) }

  it { should be_valid }
end
