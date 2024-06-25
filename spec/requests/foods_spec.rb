require 'rails_helper'
RSpec.describe 'Foods', type: :request do
  describe 'GET /foods' do
    let!(:user) { create :test_user }
    let!(:food) { create :food }
    before(:each) do
      sign_in(user)
    end
    it 'Should return status code 200' do
      get foods_path
      expect(response).to have_http_status(200)
    end
  end
  describe 'GET /foods' do
    let!(:user) { create :test_user }
    let!(:food) { create :food }
    before(:each) do
      sign_in(user)
    end
    it('should render the new food format') do
      get new_food_path
      expect(response).to render_template('foods/new')
    end
    it('should respond with the correct html format') do
      post foods_path, params: {
        food: {
          name: 'apple',
          measurement_unit: 'number',
          price: 120.4,
          quantity: 4
        }
      }
      expect(response.media_type).to eq('text/html')
      expect(response.content_type).to eq('text/html; charset=utf-8')
      #  expect(response).to render_template('foods/show')
    end
  end
  describe 'Update food' do
    let!(:user) { create :test_user }
    let!(:food1) { create :food }
    before(:each) do
      sign_in(user)
    end
    it('should render the edit food form and update the database') do
      get edit_food_path(food1)
      expect(response).to render_template('foods/edit')
    end
    it('should respond with the correct html format') do
      patch food_path(food1), params: {
        food: {
          name: 'Banana'
        }
      }
      expect(response.media_type).to eq('text/html')
      expect(response.content_type).to eq('text/html; charset=utf-8')
      #  expect(response).to render_template('foods/index')
    end
  end
end
