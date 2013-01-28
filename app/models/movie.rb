class Movie < ActiveRecord::Base
  attr_accessible :seen, :title, :year
  
  validates :title, :presence => true
  validates :year, :numericality => true
  validate :check_year_for_range
  
  def check_year_for_range
    if self.year < 1900 then
      self.errors.add(:year, "must be 1900 or more recent")
    elsif self.year > 2013 then
      self.errors.add(:year, "must be 2013 or older")
    end
end
