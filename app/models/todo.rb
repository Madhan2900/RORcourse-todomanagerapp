class Todo < ActiveRecord::Base

	belongs_to :user		# knows that there is a table todos and finds a todo for that user using the user_id
							# Todo.last
							# Todo.last.user displays user details of the last todo.

	def due_today?
		due_date == Date.today 
	end

	def self.overdue
		all.where("due_date < ? AND completed = ?", Date.today,false)
	end

	def self.due_today
		all.where("due_date = ?", Date.today)
	end
	
	def self.due_later
		all.where("due_date > ?", Date.today)	
	end

	def self.completed
		all.where(completed: true)
	end
end