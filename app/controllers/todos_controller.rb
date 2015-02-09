class TodosController < ApplicationController
	before_action :find_todo, only: [:update, :destroy, :edit]
	skip_before_action :verify_authenticity_token


	def index
		@todo = Todo.new
		@all_todos = Todo.all
		if params[:completed] == "true"
			@all_todos = @all_todos.where(completed: true)
		elsif params[:completed] == "false"
			@all_todos = @all_todos.where(completed: false)
		end
	end

	def new
		@todo = Todo.new
	end

	def create
		@todo = Todo.create(params.require(:todo).permit(:title,:completed))
		redirect_to root_url
		# @todo = Todo.new(todo_params)
		# @todo.save
		# if @todo.save
		#   redirect_to root_path
		# else
		# 	render "new"
		# end
	end

	def update
		@todo = Todo.find(params[:id])
		@todo.update(params.require(:todo).permit(:completed))
		redirect_to root_url
	end

	def edit
		@todo = Todo.find(params[:id])
	end

	def show
		@todo = Todo.find(params[:id])
	end

	def toggle_all
		Todo.update_all(completed: params[:completed] ? 't' : 'f')

		@todos = Todo.all
		render :nothing => true
	end

	def toggle_complete
		@todo = Todo.find(params[:id])
		@todo.toggle!(:completed)
		render :nothing => true
	end


	def active
		@all_todos = Todo.where(completed: 'f')
		render :active
	end

	def completed
		@all_todos = Todo.where(completed: 't')
	end

	def destroy_completed
		@todos = Todo.completed.all
		@todos.destroy
	end

	def destroy
		@todo = Todo.find(params[:id])
		@todo.destroy
		redirect_to root_url
	end

	def clear_completed
		Todo.where(completed: true).update_all(completed: false)
	end

	private

	def todo_params
		params.require(:todo).permit(:completed)
	end

	def find_todo
		@todo = Todo.find(params[:id])
	end
end

