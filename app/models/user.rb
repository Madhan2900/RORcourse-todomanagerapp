class User < ApplicationRecord

	has_secure_password		# enables the use of BCrypt gem.
	has_many :todos			# has-many relation between user and his todos.
							# user = User.last
							# user.todos displays all the todos of that user.
end