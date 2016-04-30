class Movie < ActiveRecord::Base
	attr_accessor :director_name
	has_many :actings, :class_name => "Acting", :foreign_key => "movie_id"
	has_many :actors, :through => :actings, :source => :actor
	has_many :reviews, dependent: :destroy
	has_many :users, through: :reviews

	belongs_to :director
	accepts_nested_attributes_for :actors, allow_destroy: true
end
