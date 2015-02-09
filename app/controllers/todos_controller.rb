class TodosController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		@todos = Todo.all
	end

	def new
		@todo = Todo.new
	end

	def create
		@todo = Todo.new(todo_params)
		@todo.save
		if @todo.save
		  redirect_to root_path
		else
			render "new"
		end
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
		@todos = Todo.where(completed: 'f')
		render :active
	end

	def completed
		@todos = Todo.completed
	end

	def destroy_completed
		@todos = Todo.completed.all
		@todos.destroy
	end

	def destroy
		@todo = Todo.find(params[:id])
		@todo.destroy
		render :index
	end

	private

	def todo_params
		params.require(:todo).permit(:title, :completed)
	end
end

