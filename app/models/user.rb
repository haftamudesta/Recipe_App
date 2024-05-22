class User < ApplicationRecord
  before_destroy :delete_associated_items
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :foods, class_name: 'Food', foreign_key: 'user_id'
  has_many :recipes, class_name: 'Recipe', foreign_key: 'user_id'
  has_many :recipe_food, through: :recipes

  validates :name, :email, presence: true
  def admin?
    role == 'admin'
  end

  def delete_associated_items
    recipes.destroy_all
    foods.destroy_all
  end
end
