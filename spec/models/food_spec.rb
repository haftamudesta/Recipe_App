require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @test_food = Food.new
  end

  describe 'When the user model is tested' do
    it 'validates the price of the food' do
      @test_food.price = 200
      expect(@test_food.price).to eq 200
    end
    it 'validates the name of the food' do
      @test_food.created_at = '2023-09-16 03:46:44.223198'
      expect(@test_food.created_at).to eq '2023-09-16 03:46:44.223198'
    end
  end
end
