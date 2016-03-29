class FoodGroup < ActiveRecord::Base
  has_many :intakes
  has_many :diets, :through => :intakes
end
