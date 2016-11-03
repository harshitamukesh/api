class Movie < ActiveRecord::Base
	has_many :users
	validates :title, presence: true, length: { minimum: 2 }
	validates :year, presence: true
	validates :rating, presence: true, format: {with:/\d/}
	validates :language, presence: true
	
end
