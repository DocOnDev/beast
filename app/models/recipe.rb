require 'open-uri'

class Recipe < ActiveRecord::Base
  has_many :nutritional_values
  has_many :food_groups, :through => :nutritional_values
  validate :check_url

  before_save :mark_nv_for_removal

def mark_nv_for_removal
  nutritional_values.each do |nv|
    nv.mark_for_destruction if nv.quantity.blank?
  end
end

def self.search(search)
  where("lower(name) LIKE ? OR lower(description) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%")
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

  def check_url
    if self.web_page && !self.web_page.empty?
      self.web_page = /^http/i.match(self.web_page) ? self.web_page : "http://#{self.web_page}"
      errors.add(:web_page, "must be a valid Web Address") if (self.web_page != "http://www.foodnetwork.com")
    end
  end

end
