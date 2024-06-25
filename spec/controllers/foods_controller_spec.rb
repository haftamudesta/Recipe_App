require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  describe 'Get index' do
    let!(:user) { create :test_user }
    let!(:food) { create :food }
    before(:each) do
      sign_in(user)
      get :index
    end
    it 'renders the indx template' do
      expect(response).to render_template('index')
    end
    it 'returns status ok' do
      expect(response).to have_http_status(:ok)
    end
  end
end
