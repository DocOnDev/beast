class FoodGroup < ActiveRecord::Base
  has_many :intakes
  has_many :diets, :through => :intakes
  has_many :recipes, :through => :nutritional_values
end
