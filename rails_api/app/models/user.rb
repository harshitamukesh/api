class User < ActiveRecord::Base
	belongs_to :movies
	validates :name, presence: true
	validates :age, presence: true
	validates :role, presence: true
	validates :gender, presence: true
	
    
end
