class Actor < ActiveRecord::Base
	has_many :actings, :class_name => "Acting", :foreign_key => "actor_id"
	has_many :movies, :through => :actings, :source => :movie
end
