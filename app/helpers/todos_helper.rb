module TodosHelper

	def complete_link_text(completeable)
		completeable.completed? ? 'Edit' : 'Complete'
	end
end
