class Loadtime < ActiveRecord::Base
  attr_accessible :loadtime, :page, :date
  validates :loadtime, :presence => true
  validates :page, :presence => true
  validates :date, :presence => true
end
