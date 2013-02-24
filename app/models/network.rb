class Network < ActiveRecord::Base
		attr_accessible :latency, :jitter, :date
		validates :latency, :presence => true
   	validates :jitter, :presence => true
   	validates :date, :presence => true
	end