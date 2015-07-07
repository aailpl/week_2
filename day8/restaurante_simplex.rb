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

	attr_reader :employees, :menu, :customers
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
		"#{@name}\t#{@price}€"		
	end
end

class Employee

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
	2 => Meal.new({:name => "Coke", :price => 2}),
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
	3. View orders 
	4. Add order 
	5. Remove order 
	6. List employees
	7. Log out"

	option = gets.chomp.to_i


	case option

		when 1
			
			if restaurant.customers.empty?
				puts "\nNo customers added yet"
			else
				puts "\nList of Customers:\n\t" + restaurant.customers.map {|key, val| 
					"ID: #{key}\ttable: " + val.to_s }.join("\n\t")
			end		

		when 2
			customers = restaurant.customers

			if customers.empty?
				customer_id = 1
			else
				customer_id = customers.keys.last + 1
			end

			puts "Customer's table:"
			table = gets.chomp.to_i
			
			customers[customer_id] = Customers.new({:table => table}) 
			
			puts "\nThe Customer in table #{restaurant.customers[customer_id]} was add with ID #{customer_id}\n"

		when 3

			puts "Insert Customer ID:"
			customer_id = gets.chomp.to_i
			puts "Order\n"
			restaurant.customers[customer_id].order.each {|key, meal|
			 puts "\tID: #{key}\t #{meal}"}

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

		when 5

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

		when 6

			puts "List of Employees:\n\t" + restaurant.employees.map {|key, val| val.to_s}.join("\n\t")
			
		when 7

			puts "Logging Out"

		else

			puts "No such option"
	end
end




