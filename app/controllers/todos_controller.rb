class TodosController < ApplicationController

	def index
		@todos = Todo.all
	end

	def new
		@todo = Todo.new
	end

	def create
		@todo = Todo.create(todo_params)
		redirect_to todos_path
	end

	def edit
		@todo = Todo.find(params[:id])
	end

	def show
		@todo = Todo.find(params[:id])
	end

	def toggle_completed
		@todo = Todo.find(params[:id])
		@todo.toggle!(:completed)
		render :nothing => true
	end
	def active
		# @todo = Todo.find(params[:id])
		@todo = Todo.active
	end

	def completed
		@todo = Todo.find(params[:id])
		@todo.completed
	end

	def destroy
		@todo = Todo.find(params[:id])
		@todo.destroy
	end

	private

	def todo_params
		params.require(:todo).permit(:item, :completed)
	end
end

