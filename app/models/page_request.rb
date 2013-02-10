class PageRequest < ActiveRecord::Base
  attr_accessible :nifty, :path, :page_duration, :view_duration, :db_duration
end
