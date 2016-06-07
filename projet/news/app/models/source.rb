class Source < ActiveRecord::Base
	has_and_belongs_to_many :reports
	
	validates :tyype, presence: true
	validates :firstname, presence: true, if: :isPhysicalSource?
	validates :firstname, length: { minimum: 3 }, if: :isPhysicalSource?
	validates :lastname, presence: true, if: :isPhysicalSource?
	validates :lastname, length: { minimum: 3 }, if: :isPhysicalSource?
	validates :name, presence: true, if: :isLogicalSource?
	validates :name, length: { minimum: 3 }
	
	def isPhysicalSource?
		:tyype == "PhysicalSource"
	end
	
	def isLogicalSource?
		:tyype == "LogicalSource"
	end

end
