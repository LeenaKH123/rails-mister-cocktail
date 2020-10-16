class Dose < ApplicationRecord
  validates :description, presence: true
  validates :ingredient, presence: true
  belongs_to :cocktail
  belongs_to :ingredient
  validates :ingredient, uniqueness: { scope: :cocktail
  }

  
end
