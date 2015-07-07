class Restaurant 
	def initialize(name,location,phone_number,employees={},menu={})
		@name = name
		@location = location
		@phone_number = phone_number
		@employees = employees
		@employees_last_id = employees.keys.last
		@customers = {}
		@customers_last_id = 0
		@menu = menu
		@meal_last_id = menu.keys.last
	end	

	attr_reader :employees, :menu, :customers, :name
	attr_writer :employees, :menu, :customers

	def to_s
		"Welcom to #{@name}!\n\n"+
		"Contact info:\n\t Location: #{@location}\n\t Phone Number: #{@phone_number}\n"+
		"Staff:\n\t"+ @employees.map { |key,val| val}.join("\n\t") +"\n"+
		"Our Menu:\n\t"+ @menu.map {|key,val| val}.join("\n\t")
	end

end

class Meal 
	
	def initialize(meal_info={})
		@name = meal_info[:name]
		@price = meal_info[:price]
	end	

	def to_s
		"#{@name}\t#{@price}$"		
	end
end

class Employee
	attr_reader :password, :job
	def initialize(employee_info={})
		@name = employee_info[:name]		
		@job = employee_info[:job]
		@password = employee_info[:password]
		@username = employee_info[:username]
	end	
	def to_s
		" #{@name}\t#{@job}"
	end
end

class Customers 

	attr_reader :order
	attr_writer :order

	def initialize(customer_info={})
		@adress = customer_info[:adress]	
		@name = customer_info[:name]
		@order = {}
		@last_order = 0 
	end	

	def to_s
		"#{@name}\t#{@adress}"
	end
end

def list_customer(restaurant)
	if restaurant.customers.empty?
		puts "\nNo customers added yet"
	else
		puts "\nList of Customers:\n\t" + restaurant.customers.map {|key, val| 
			"ID: #{key}\t#{val.to_s}" }.join("\n\t")
	end		
end

def add_customer(restaurant)
	customers = restaurant.customers

	if customers.empty?
		customer_id = 1
	else
		customer_id = customers.keys.last + 1
	end

	puts "Customer's name:"
	name = gets.chomp
	puts "Customer's adress:"
	adress = gets.chomp
	
	customers[customer_id] = Customers.new({:adress => adress, :name => name}) 
	puts "\nCustomer Added\n\t ID: #{customer_id}\t#{restaurant.customers[customer_id]}\n"

end

def view_orders(restaurant)
	puts "Insert Customer ID:"
	customer_id = gets.chomp.to_i
	puts "Order\n"
	restaurant.customers[customer_id].order.each {|key, meal|
	puts "\tID: #{key}\t #{meal}"}
end

def add_order(restaurant)
	order = {}
	order_index = 1

	puts "Customer ID:" 
	customer_id = gets.chomp.to_i

	customer = restaurant.customers[customer_id]

	if customer == nil
		puts "Customer not on the list"
	else
		
		puts "Insert Meal ID: [E to exit]"

		loop do
			meal_id = gets.chomp

			if meal_id == "E"
				break
			else
				if restaurant.menu[meal_id.to_i] == nil
					puts "Meal not in the Menu"
				else
					customer.order[order_index] = restaurant.menu[meal_id.to_i]
					order_index += 1			
				end
			end
		end
		puts "Order saved"
		customer.order.each {|id,meal| puts "ID: #{id}\t#{meal}"}
	end
end	

def remove_order(restaurant)
	puts "Customer's ID:"
	customer_id = gets.chomp.to_i
	customer = restaurant.customers[customer_id]

	if customer == nil
		puts "customer not found"
	else
		puts "Order  ID:"
		order_id = gets.chomp.to_i
		customer.order.delete(order_id)
		puts "Order removed"
		puts "Present Orders:"
		customer.order.each {|id,meal| puts "ID: #{id}\t#{meal}"}
	end
end

def list_employees(restaurant)
	puts "List of Employees:\n\t" + restaurant.employees.map {|key, val| val.to_s}.join("\n\t")
end

def customer_details(restaurant)
	puts "Customer ID:"
	customer_id = gets.chomp.to_i
	puts "Customer Details:\n\t"+
	"Adress: #{restaurant.customers[customer_id]}"
end

def add_employee(restaurant)
	
end


employees = {
	1 => Employee.new({:name => "Bob", :job => "Manager", :password => "1234"}),
	2 => Employee.new({:name => "Alice", :job => "Waiter", :password => "qwer"}),
	3 => Employee.new({:name => "Marck", :job => "Delivery", :password => "asdf"})
}

menu = {
	1 => Meal.new({:name => "Cheese Burger", :price => 5}),
	2 => Meal.new({:name => "Coke", :price => 2}),
	3 => Meal.new({:name => "Spagetti", :price => 5.5})
}

restaurant =  Restaurant.new("Casa di Mama","5th Stree","123409876",employees,menu)

puts "Welcome to #{restaurant.name}\n_______________________\n"

puts "Please enter your ID:"
employee_id = gets.chomp.to_i

puts "Please enter your password:"
password = gets.chomp

employee = restaurant.employees[employee_id]
#p employee

if employee.password != password
	puts "password incorrect"
else
 
	case employee.job

		when "Manager"
			option = 0

		until option == 8

			puts "\nWhat would you like to do?

Options:
	1. List customers
	2. Add customer
	3. View orders 
	4. Add order 
	5. Remove order 
	6. List employees
	7. Add employees
	8. Log out"

			option = gets.chomp.to_i

			case option

				when 1
					list_customer(restaurant)
				when 2
					add_customer(restaurant)
				when 3
					view_orders(restaurant)			
				when 4
					add_order(restaurant)
				when 5
					remove_order(restaurant)
				when 6
					list_employees(restaurant)		
				when 7
					add_employees(restaurant)
				when 8					
					puts "Logging Out"
				else
					puts "No such option"
			end
		end

		when "Waiter"

		option=0

		until option == 6			

			puts "\nWhat would you like to do?

Options:
	1. List customers
	2. Add customer
	3. View orders 
	4. Add order 
	5. Remove order 
	6. Log out"

			option = gets.chomp.to_i


			case option

				when 1
					list_customer(restaurant)
				when 2
					add_customer(restaurant)
				when 3
					view_orders(restaurant)			
				when 4
					add_order(restaurant)
				when 5
					remove_order(restaurant)	
				when 6
					puts "Logging Out"
				else
					puts "No such option"
			end
		end

		when "Delivery"			

		option = 0

		until option == 4
			puts "\nWhat would you like to do?

Options:
	1. List customers
	2. Customer details
	3. View orders 
	4. Log out"

			option = gets.chomp.to_i

			case option

				when 1
					list_customer(restaurant)
				when 2
					customer_details(restaurant)
				when 3
					view_orders(restaurant)			
				when 4
					puts "Logging Out"
				else
					puts "No such option"
			end
		end	
	end
end