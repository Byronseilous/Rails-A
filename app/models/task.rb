class Task < ActiveRecord::Base
	belongs_to :user
	validates :status,
				presence:true
end
