class CreateMedicalRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :medical_records do |t|
      t.text :symptoms
      t.text :treatment
      t.references :pet, foreign_key: true

      t.timestamps
    end
  end
end
