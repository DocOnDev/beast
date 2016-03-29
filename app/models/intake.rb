class Intake < ActiveRecord::Base
  belongs_to :diet
  belongs_to :food_group
end
