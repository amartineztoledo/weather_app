require 'rails_helper'

RSpec.describe City, type: :model do
  subject {described_class.new}

  it "not valid without a name" do
    expect(subject).to_not be_valid
  end

  it "valid with valid attributes" do 
    subject.name = "city"
    expect(subject).to be_valid
  end
end

