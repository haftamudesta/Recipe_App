require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @recipe = Recipe.new
  end

  describe 'When the recipes model is tested' do
    it 'validates the recipe object' do
      @recipe.name = 'haftamu'
      expect(@recipe.name).to eq 'haftamu'
    end
    it 'validates the recipe object' do
      @recipe.description = 'the first apple'
      expect(@recipe.description).to eq 'the first apple'
    end
  end
end
