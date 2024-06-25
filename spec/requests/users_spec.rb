require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { create :user }
  before(:each) do
    sign_in(user)
  end
  describe 'GET /users' do
    it 'should return the status code 200' do
      get users_path
      expect(response).to have_http_status(200)
    end
  end
end
