require 'active_record'

def connect_db!
	ActiveRecord::Base.establish_connection(

		host: 'localhost',
		adapter: 'postgresql',
		database: 'saas_db',
		user: 'madhan',
		password: 'pass123'
		)
end
