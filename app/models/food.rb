class Food < ApplicationRecord
  has_many :recipe_foods, dependent: :destroy
  belongs_to :user, optional: true

  validates :name, :measurement_unit, presence: true
  validates :price, :quantity, presence: true, numericality: { greater_than: 0 }
end
