class Entry < ActiveRecord::Base
  belongs_to :food_group
  belongs_to :user
end
