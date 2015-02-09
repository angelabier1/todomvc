class Todo < ActiveRecord::Base
	 scope :completed, -> {where(completed: true)}
	 scope :active, -> {where(completed: false)}
	 validates :title, presence: true



end
