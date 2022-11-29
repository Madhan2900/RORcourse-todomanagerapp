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
		@todo = Todo.new(todo_params)
		if @todo.save
			redirect_to todos_path
		else
			render :new
		end
	end

	def edit
		@todo = Todo.find(params[:id])
	end

	def update
		@todo = Todo.find(params[:id])
		if @todo.update(todo_params)
			redirect_to todos_path
		else
			render :edit
		end
	end

	private

	def todo_params
		params.require(:todo).permit(:todo_text, :due_date, :completed)
	end

end