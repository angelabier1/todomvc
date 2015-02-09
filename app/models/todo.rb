class Todo < ActiveRecord::Base
	 scope :completed, -> {where(completed: 't')}
	 scope :active, -> {where(completed: 'f')}
	 validates :title, presence: true



end
