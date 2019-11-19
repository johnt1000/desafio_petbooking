class Pet < ApplicationRecord
  enum pet_type: { gato: 1, cachorro: 2 }
  enum race: { pastor_alemao: 1, fila_brasileiro: 2, vira_latas: 3, persa: 4 }
  validates :name, presence: true
end
