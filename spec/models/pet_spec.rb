require 'rails_helper'

RSpec.describe Pet, type: :model do
  let!(:pet) { Fabricate(:pet) }

  it "have name" do
    expect(pet.name).to eq('Gatinho')
  end

  it "have date_of_birth" do
    expect(pet.date_of_birth).to eq('2019-01-01')
  end

  it "have race" do
    expect(pet.race.capitalize).to eq('Persa')
  end

  it "have pet_type" do
    expect(pet.pet_type.capitalize).to eq('Gato')
  end

  describe '#name' do
    it 'validates presence' do
      pet.name = nil
      pet.valid?
      expect(pet.errors[:name]).to eq ["can't be blank"]
    end
  end
end
