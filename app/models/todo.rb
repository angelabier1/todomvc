class Todo < ActiveRecord::Base
	# scope :completed, -> { where("completed = ?", 't') }
	# scope :active, -> { where("completed = ?", 'f') }
	validates :item, presence: true


	def completed
		if completed == 't'
		true
		else
			nil
		end

	end

	def active
	  if completed == 'f'
	  true
	  else
	  nil
	  end

	end

end
