class Restaurant 
	def initialize(name,location,phone_number,employees=[],menu=[])
		@name = name
		@location = location
		@phone_number = phone_number
		@employees = employees
		@employees_last_id = employees.last.id
		@customers = {}
		@customers_last_id = 0
		@menu = menu
		@meal_last_id = menu.last.id
	end	

	attr_reader :employees, :menu, :customers, :employees_last_id, :meal_last_id, :customers_last_id

	def add_meal(meal)
		@menu << Meal.new(meal)
		@meal_last_id = menu[:id]
	end

	def add_employee(employee)
		@employees << Employee.new(employee) #username, password
		@employees_last_id = employees[:id]
	end

	def add_customer(customer)
		@customers << Customers.new(customer)
		@customers_last_id = customer[:id]
	end

	def search_meal(meal_id)
		@menu.each do |meal|
			if meal.id == meal_id
				return meal
			end
		end
	end

	def search_employee(employee_id)
		@employees.each do |employee|
			if employee.id == employee_id
				return employee
			end
		end
	end

	def search_customer(customer_id)
		@customers.each do |customer|
			if customer.id == customer_id
				return customer
			end
		end
	end

	def to_s
		"Welcom to #{@name}!\n\n"+
		"Contact info:\n\t Location: #{@location}\n\t Phone Number: #{@phone_number}\n"+
		"Staff:\n\t"+ @employees.join("\n\t")+"\n"+
		"Our Menu:\n\t"+ @menu.join("\n\t")
	end

end

#This is a has-a relationship, where Child has-a Other that it uses to get its work done.
#You simply create a module with functions that are common to classes and then include
# them in your class similar to using a require.
#model Other .... class Child include Other Other.alter()

class Meal 
	
	attr_reader :id

	def initialize(meal_info={})
		@id = meal_info[:id]
		@name = meal_info[:name]
		@price = meal_info[:price]
	end	

	def to_s
		"#{@name}\t#{@price}"		
	end
end

class Employee

	attr_reader :id

	def initialize(employee_info={})
		@id = employee_info[:id]
		@name = employee_info[:name]		
		@job = employee_info[:job]
	end	
	def to_s
		" #{@name}\t#{@job}"
	end
end

class Customers 

	attr_reader :id

	def initialize(customer_info={})
		@id = customer_info[:id]	
	end	

	def to_s
		"Customer id: " + @id.to_s
	end
end

employees = [
	Employee.new({:id => 1 ,:name => "Bob", :job => "Manager"}),
	Employee.new({:id => 2 ,:name => "Alice", :job => "Waiter"}),
	Employee.new({:id => 3 ,:name => "Marck", :job => "Delivery Guy"})
]

menu = [
	Meal.new({:id => 1, :name => "Cheese Burger", :price => 5}),
	Meal.new({:id => 3, :name => "Spagetti", :price => 5.5})
]

customers = [
	Customers.new({:id => 1 , :entry_time => "20:20"}),
	Customers.new({:id => 2}),
	Customers.new({:id => 3})
]

restaurant =  Restaurant.new("Casa di Mama","5th Stree","123409876",employees,menu)

option = 0

until option == 7

	puts "\nWhat would you like to do?

Options:
	1. List customers
	2. Add customer
	3. View orders <customer_id>
	4. Add order <customer_id>, <employee_id_>
	5. Remove order <order_id>
	6. List employees
	7. Log out"

	option = gets.chomp.to_i


	case option

		when 1
			
			if restaurant.customers.empty?
				puts "\nNo customers added yet"
			else
				puts "\nList of Customers:\n\t" + restaurant.customers.join("\n\t")
			end		

		when 2

			customer_id = (restaurant.customers_last_id + 1)
			if restaurant.add_customer({:id => customer_id }) == 0
				puts "\nInserion error: No customer added"			
			else
				puts "\nThe Customer with id #{customer_id} was addded"
			end

			sleep 0.5

		when 3

			puts "Unavailable option"

		when 4

			puts "Unavailable option"

		when 5

			puts "Unavailable option"

		when 6

			puts "List of Employees:\n\t" + restaurant.employees.join("\n\t")

			sleep 0.5
			
		when 7

			puts "Logging Out"

		else

			puts "No such option"
	end
end

# restaurant.add_customer({:id => 1})
# restaurant.add_employee({:id => 4,:name =>"Chris", :job => "Waiter"})
# restaurant.add_meal({:id => 2, :name => "Coke", :price => 2})
# restaurant.add_customer({:id => 5})

# p restaurant.customers_last_id
# p restaurant.employees_last_id
# p restaurant.meal_last_id


