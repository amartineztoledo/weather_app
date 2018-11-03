require 'rails_helper'

RSpec.describe Weather, type: :model do
  subject { described_class.new }

  it "is not valid without City" do
    subject.temp = 0
    expect(subject).to_not be_valid
  end

  it "not valid without temp" do
    subject.city = City.new
    expect(subject).to_not be_valid
  end

  it "not valid if temp is greather than 100" do
    subject.temp = 100.1
    subject.city = City.new
    expect(subject).to_not be_valid
  end

  it "not valid if temp is less than -100 " do
    subject.temp = -100.1
    subject.city = City.new
    expect(subject).to_not be_valid
  end

  it "is valid with valid attributes" do
    subject.temp = 99
    subject.city = City.new
    expect(subject).to be_valid
  end

end
