require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  describe 'get index' do
    let!(:user) { create :user }
    before(:each) do
      sign_in(user)
      get :index
    end
    it 'assign @users' do
      expect(assigns(:users)).to eq([user])
    end
    it 'renders the indx template' do
      expect(response).to render_template('index')
    end
    it 'returns status ok' do
      expect(response).to have_http_status(:ok)
    end
  end
end
