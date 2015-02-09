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
	end

	def toggle_completed
		@todo = Todo.find(params[:id])
		@todo.toggle!(:completed)
		render :nothing => true
	end
	def active
		@todos = Todo.select {|todo| todo.completed == false}
	end

	def completed
		@todos = Todo.select {|todo| todo.completed}
	end

	def destroy
		@todo = Todo.find(params[:id])
		@todo.destroy
	end

	private

	def todo_params
		params.require(:todo).permit(:title)
	end
end

