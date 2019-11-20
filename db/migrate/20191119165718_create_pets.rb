class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name, null: false
      t.string :date_of_birth
      t.integer :race
      t.integer :pet_type

      t.timestamps
    end
  end
end
