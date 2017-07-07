task :setup_data => :environment do 

	
		User.create(email: "admin@gmail.com",password: "admin123", is_admin: true,cl: 10 )

		User.create(email: "user@gmail.com",password: "user123", is_admin: false,cl: 10 )

		
end
