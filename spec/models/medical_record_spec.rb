require 'rails_helper'

RSpec.describe MedicalRecord, type: :model do
  let!(:medical_record) {
    Fabricate(:medical_record)
  }

  it "have pet" do
    expect(medical_record.pet.name).to eq('Gatinho')
  end

  it "have symptoms" do
    expect(medical_record.symptoms).to eq('Febre e olhos amarelados')
  end

  it "have treatment" do
    expect(medical_record.treatment).to eq('50mg de cafeína')
  end
end
