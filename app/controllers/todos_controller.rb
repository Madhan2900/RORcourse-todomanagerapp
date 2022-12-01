class TodosController < ApplicationController
	def index
		@todos = Todo.all
		#render plain: Todo.order(:due_date).map{|todo| todo.to_pleasant_string}.join("\n")
	end

	#def show
	#	id = params[:id]
	#	todo = Todo.find(id)
	#	render plain: todo.to_pleasant_string
	#end

	def new
		@todo = Todo.new
	end

	def create
		
		todo_text = params[:todo_text]
		due_date = DateTime.parse(params[:due_date])
		new_todo = Todo.create!(
			todo_text: todo_text,
			due_date: due_date,
			completed: false
			)
		redirect_to todos_path
	end

	def edit
		@todo = Todo.find(params[:id])
	end

	def update
		id = params[:id]
		completed = params[:completed]
		todo = Todo.find(id)
		todo.completed = completed
		todo.save!

		redirect_to todos_path

	end

	def destroy
		id = params[:id]
		todo = Todo.find(id)
		todo.destroy

		redirect_to todos_path
	end

	#private

	#def todo_params
		#params.require(:todo).permit(:todo_text, :due_date, :completed)
	#end

end