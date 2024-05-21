class AddReferences < ActiveRecord::Migration[7.1]
  def change
    add_reference :recipes, :user, foreign_key: { to_table: 'users'}
    add_reference :foods, :user, foreign_key: { to_table: 'users' }
    add_reference :recipe_foods, :recipe, foreign_key:  { to_table: 'recipes' }
    add_reference :recipe_foods, :food, null: false, foreign_key: true
  end
end
