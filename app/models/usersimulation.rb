class Usersimulation < ActiveRecord::Base
	attr_accessible :status, :interval, :numsims
	validates :status, :presence => true
	validates :interval, :presence => true
	validates :numsims, :presence => true
end
