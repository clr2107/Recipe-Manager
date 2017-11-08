class Recipe < ApplicationRecord
  validates :name, :difficulty, :directions, :ingredients, :category, :user, presence: true
  validates :prep_time, presence: true
  validates_numericality_of :prep_time, on: :create, :greater_than_or_equal_to => 1
  
  belongs_to :user
  has_many :ratings


  def self.ingredient_search(ingredient)
    return Recipe.where("ingredients ILIKE ?", "%#{ingredient}%")
  end

  #  def self.name_search(name)
  #  return Recipe.where("ingredients ILIKE ?", "%#{name}%")
  # end

end
