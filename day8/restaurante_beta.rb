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

	attr_reader :employees, :menu, :customers, :employees_last_id, :meal_last_id, :customers_last_id

	def to_s
		"Welcom to #{@name}!\n\n"+
		"Contact info:\n\t Location: #{@location}\n\t Phone Number: #{@phone_number}\n"+
		"Staff:\n\t"+ @employees.map { |key,val| val}.join("\n\t") +"\n"+
		"Our Menu:\n\t"+ @menu.map {|key,val| val}.join("\n\t")
	end

end

class Meal 
	
	attr_reader :id

	def initialize(meal_info={})
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
		@name = employee_info[:name]		
		@job = employee_info[:job]
	end	
	def to_s
		" #{@name}\t#{@job}"
	end
end

class Customers 

	attr_reader :table, :order
	attr_writer :order

	def initialize(customer_info={})
		@table = customer_info[:table]	
		@order = {}
		@last_order = 0 
	end	

	def to_s
		"#{@table}"
	end
end

employees = {
	1 => Employee.new({:name => "Bob", :job => "Manager"}),
	2 => Employee.new({:name => "Alice", :job => "Waiter"}),
	3 => Employee.new({:name => "Marck", :job => "Delivery Guy"})
}

menu = {
	1 => Meal.new({:name => "Cheese Burger", :price => 5}),
	3 => Meal.new({:name => "Spagetti", :price => 5.5})
}

#menu[3]

customers = {
	1 => Customers.new({:table => 1 , :entry_time => "20:20"}),
	2 => Customers.new({:table => 2}),
	3 => Customers.new({:table => 3})
}

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
				puts "\nList of Customers:\n\t" + restaurant.customers.map {|key, val| 
					"ID: #{restaurant.customers_last_id }\ttable: " + val.to_s }.join("\n\t")
			end		

		when 2

			puts "Customer's table:"
			table = gets.chomp.to_i
			if restaurant.add_customer({:table => table}) == 0
				puts "\nInserion error: No customer added"			
			else
				puts "\nThe Customer with id #{restaurant.customers_last_id} was addded"
			end

		when 3

			restaurant.customer.order(customer_id)

		when 4

			order = {}
			order_index = 1

			puts "Customer ID:" 
			customer_id = gets.chomp.to_i

			customer = restaurant.customers[customer_id]


			puts "Insert Meal ID: [E to exit]"

			loop do
				meal_id = gets.chomp
				if meal_id == "E"
					break
				else
					customer.order[order_index] = restaurant.menu[meal_id.to_i]
					order_index += 1				
				end
			end
			puts "Order saved"

		when 5

			puts "remove order"

		when 6

			puts "List of Employees:\n\t" + restaurant.employees.map {|key, val| val.to_s}.join("\n\t")
			
		when 7

			puts "Logging Out"

		else

			puts "No such option"
	end
end




