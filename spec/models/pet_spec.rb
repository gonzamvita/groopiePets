require 'rails_helper'

RSpec.describe Pet, type: :model do
  before(:each) do
    @pet = Pet.create({ name: 'pet1', age: 1, breed: 'dog' })
  end

  describe 'photo_url' do
    it 'returns a string' do
      expect(@pet.photo_url).to be_a(String)
    end
  end
end
