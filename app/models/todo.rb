class Todo < ActiveRecord::Base
	# scope :completed, -> { where("completed = ?", 't') }
	# scope :active, -> { where("completed = ?", 'f') }
	validates :title, presence: true

	def title=(title)
		write_attribute(:title, title.strip)
	end

	def self.active
	  select{|a| a.completed == false}
	end

	def self.completed
		select{|c| c.completed}
	end

end
