require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @test_recipe = Food.new
  end

  describe 'When the user model is tested' do
    it 'validates the name of the food' do
      @test_recipe.updated_at = '2023-09-16 03:46:44.223198'
      expect(@test_recipe.updated_at).to eq '2023-09-16 03:46:44.223198'
    end
  end
end
