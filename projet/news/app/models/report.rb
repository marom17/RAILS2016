class Report < ActiveRecord::Base
	has_and_belongs_to_many :categories
	has_and_belongs_to_many :sources
	belongs_to :user
	
	validates :title, presence: true
	validates :head, presence: true
	validates :text, presence: true
	
	validate :has_relations

	# Vérifie la présence d'au minimum une source et une catégorie à la news
	def has_relations
		errors.add(:base, 'Au minimum une source doit être liée') if self.sources.blank?
		errors.add(:base, 'Au minimum une catégorie doit être liée') if self.categories.blank?
	end
end
