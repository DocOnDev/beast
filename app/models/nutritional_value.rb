class NutritionalValue < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :food_group
end
