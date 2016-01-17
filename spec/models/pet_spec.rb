require 'rails_helper'

RSpec.describe Pet, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:pet)).to be_valid
  end

  it "is invalid without name" do
    expect(FactoryGirl.build(:pet, name: nil)).to_not be_valid
  end

  it "is invalid without age" do
    expect(FactoryGirl.build(:pet, age: nil)).to_not be_valid
  end

  it "validates numericality of age" do
    expect(FactoryGirl.build(:pet, age: 'ocho')).to_not be_valid
  end

  it "is invalid without breed" do
    expect(FactoryGirl.build(:pet, breed: nil)).to_not be_valid
  end

  describe 'photo_url' do
    it 'returns a string' do
      pet = FactoryGirl.create(:pet)
      expect(pet.photo_url).to be_a(String)
    end
  end
end
