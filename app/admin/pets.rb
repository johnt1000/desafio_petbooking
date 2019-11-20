ActiveAdmin.register Pet do

  permit_params :name, :date_of_birth, :race, :pet_type
  
  filter :name
  filter :race
  filter :pet_type

  index do
    selectable_column
    id_column
    column :name
    column :date_of_birth
    column :race
    column :pet_type
    # actions
    actions dropdown: true do |pet|
      item "Medical Records", admin_pet_medical_records_path(pet)
    end
  end

  show do
    attributes_table do
      row :name
      row :date_of_birth
      row :race
      row :pet_type
    end
  end

  form do |f|
    f.inputs 'Informações Básicas' do
      f.input :id, :input_html => { :disabled => true } if !f.object.new_record?
      f.input :name
      f.input :date_of_birth, as: :datepicker
      f.input :race
      f.input :pet_type
    end
    div style: 'clear: both'
    f.actions
  end

end
