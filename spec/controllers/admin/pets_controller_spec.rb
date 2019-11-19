require 'rails_helper'

RSpec.describe Admin::PetsController, type: :controller do
  render_views

  let(:page) { Capybara::Node::Simple.new(response.body) }
  let!(:pet) { Fabricate :pet }

  let(:valid_attributes) do
    {
      name: pet.name,
      date_of_birth: pet.date_of_birth,
      race: pet.race,
      pet_type: pet.pet_type
    }
  end

  let(:invalid_attributes) do
    { name: '' }
  end

  describe "GET index" do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'assigns the pet' do
      get :index
      expect(assigns(:pets)).to include(pet)
    end
    it "should render the expected columns" do
      get :index
      expect(page).to have_content(pet.name)
      expect(page).to have_content(pet.date_of_birth)
      expect(page).to have_content(pet.race)
      expect(page).to have_content(pet.pet_type)
    end
  end

  describe "GET new" do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
    it 'assigns the pet' do
      get :new
      expect(assigns(:pet)).to be_a_new(Pet)
    end
    it "should render the form elements" do
      get :new
      expect(page).to have_field('Name*')
      expect(page).to have_field('Date of birth')
      expect(page).to have_field('Race')
      expect(page).to have_field('Pet type')
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new Pet" do
        expect { 
          post :create, params: { pet: valid_attributes }
        }.to change(Pet, :count).by(1)
      end

      it "assigns a newly created pet as @pet" do
        post :create, params: { pet: valid_attributes }
        expect(assigns(:pet)).to be_a(Pet)
        expect(assigns(:pet)).to be_persisted
      end

      it "redirects to the created pet" do
        post :create, params: { pet: valid_attributes }
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_pet_path(Pet.last))
      end

      it 'should create the pet' do
        post :create, params: { person: valid_attributes }
        pet = Pet.last

        expect(pet.name).to eq(valid_attributes[:name])
        expect(pet.date_of_birth).to eq(valid_attributes[:date_of_birth])
        expect(pet.race).to eq(valid_attributes[:race])
        expect(pet.pet_type).to eq(valid_attributes[:pet_type])
      end
    end

    context "with invalid params" do
      it 'invalid_attributes return http success' do
        post :create, params: { pet: invalid_attributes }
        expect(response).to have_http_status(:success)
      end

      it "assigns a newly created but unsaved pet as @pet" do
        post :create, params: { pet: invalid_attributes }
        expect(assigns(:pet)).to be_a_new(Pet)
      end

      it 'invalid_attributes do not create a Pet' do
        expect do
          post :create, params: { pet: invalid_attributes }
        end.not_to change(Pet, :count)
      end
    end
  end

  describe "GET edit" do
    before do
      get :edit, params: { id: pet.id }
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'assigns the pet' do
      expect(assigns(:pet)).to eq(pet)
    end
    it "should render the form elements" do
      expect(page).to have_field('Name*', with: pet.name)
      expect(page).to have_field('Date of birth', with: pet.date_of_birth)
      expect(page).to have_field('Race', with: pet.race)
      expect(page).to have_field('Pet type', with: pet.pet_type)
    end
  end

  describe "PUT update" do
    context 'with valid params' do
      before do
        put :update, params: { id: pet.id, pet: valid_attributes }
      end
      it 'assigns the pet' do
        expect(assigns(:pet)).to eq(pet)
      end
      it 'returns http redirect' do
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_pet_path(pet))
      end
      it "should update the pet" do
        pet.reload

        expect(pet.name).to eq(valid_attributes[:name])
        expect(pet.date_of_birth).to eq(valid_attributes[:date_of_birth])
        expect(pet.race).to eq(valid_attributes[:race])
        expect(pet.pet_type).to eq(valid_attributes[:pet_type])
      end
    end
    context 'with invalid params' do
      it 'returns http success' do
        put :update, params: { id: pet.id, pet: invalid_attributes }
        expect(response).to have_http_status(:success)
      end
      it 'does not change pet' do
        expect do
          put :update, params: { id: pet.id, pet: invalid_attributes }
        end.not_to change { pet.reload.name }
      end
    end
  end

  describe "GET show" do
    before do
      get :show, params: { id: pet.id }
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'assigns the pet' do
      expect(assigns(:pet)).to eq(pet)
    end
    it "should render the form elements" do
      expect(page).to have_content(pet.name)
      expect(page).to have_content(pet.date_of_birth)
      expect(page).to have_content(pet.race)
      expect(page).to have_content(pet.pet_type)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested select_option" do
      expect {
        delete :destroy, params: { id: pet.id }
      }.to change(Pet, :count).by(-1)
    end

    it "redirects to the field" do
      delete :destroy, params: { id: pet.id }
      expect(response).to redirect_to(admin_pets_path)
    end
  end
end