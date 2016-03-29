class Diet < ActiveRecord::Base
  belongs_to :user
  has_many :intakes
  has_many :food_groups, :through => :intakes

  accepts_nested_attributes_for :intakes ,
  :allow_destroy => true,
  :reject_if     => :all_blank

end
