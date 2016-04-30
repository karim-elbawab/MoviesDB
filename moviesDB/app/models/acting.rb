class Acting < ActiveRecord::Base
	belongs_to :movie
	belongs_to :actor
end
