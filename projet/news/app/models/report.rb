class Report < ActiveRecord::Base
	has_and_belongs_to_many :categories
	has_and_belongs_to_many :sources
	belongs_to :user
	
	validates :title, presence: true
	validates :head, presence: true
	validates :text, presence: true
end
