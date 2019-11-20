ActiveAdmin.register MedicalRecord do
  
  belongs_to :pet

  permit_params :symptoms, :treatment, :pet_id

  filter :symptoms
  filter :treatment

  index do
    selectable_column
    id_column
    column :pet
    column :symptoms
    column :treatment
    actions
  end

  show do
    attributes_table do
      row :pet
      row :symptoms
      row :treatment
    end
  end

  form do |f|
    f.inputs 'Atendimento' do
      f.input :symptoms
      f.input :treatment
    end
    div style: 'clear: both'
    f.actions
  end
end
