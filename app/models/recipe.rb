class Recipe < ActiveRecord::Base
  has_many :nutritional_values
  has_many :food_groups, :through => :nutritional_values

  before_save :mark_nv_for_removal

def mark_nv_for_removal
  nutritional_values.each do |nv|
    nv.mark_for_destruction if nv.quantity.blank?
    p "Marked #{nv.id} for destruction"
  end
end

def self.search(search)
  where("lower(name) LIKE ? OR lower(description) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%")
  # where("description LIKE ?", "%#{search}%")
end

  accepts_nested_attributes_for :nutritional_values, allow_destroy: true, :reject_if => :reject_nv

  def reject_nv(attributes)
    if attributes[:quantity].blank?
      if attributes[:id].present?
        attributes.merge!({:_destroy => 1}) && false
      else
        true
      end
    end
  end

end
