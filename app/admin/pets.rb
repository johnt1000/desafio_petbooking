ActiveAdmin.register Pet do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :date_of_birth, :race, :pet_type
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :date_of_birth, :race, :pet_type]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
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
    actions
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
