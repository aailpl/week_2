class OrangeTree 
	
	attr_reader :age, :height, :fruits
	def initialize
		@age = 0
		@height = 0
		@fruits = 0
		@life = 0
	end	

	def one_year_passes!
		age_one_year
		check_life		
	end

	def pick_a_fruit!
		if @fruits>0
			@fruits -= 1
		end
		@fruits
	end

	def dead?
		@life == "dead"
	end
	private

	def age_one_year
		@age += 1
	end

	def check_life
		if @age>=50
			probabiblity_of_dying
		else
			life_cycle
		end
	end

	def life_cycle
		growth
		fruits_production		
	end

	def growth
		if @age<=10
			@height+=1
		end
	end

	def fruits_production
		if @age>5 and @age<=10
			@fruits=100
		elsif @age>10 and @age<=15
			@fruits=200
		else
			@fruits=0
		end
	end

	def probabiblity_of_dying
		probability_weight = ((@age-50)*100)/50
		p probability_weight
		@life = choose_weighted({:alive => (100-probability_weight),:dead =>  probability_weight})
		if  @life == "alive"
			life_cycle
		end
	end
	def choose_weighted(weighted)

		sum = weighted.inject(0) do |sum, item_and_weight|
			sum += item_and_weight[1]
		end
		target = rand(sum)
		weighted.each do |item, weight|
			return item.to_s if target <= weight
			target -= weight
		end		
	end

	def to_s
		if @life == "alive"
			"Hi! I'm an Orange Tree with #{@age} years old,\n\t"+
			 "#{@height} meters tall,\n\t\t producing #{@fruits} oranges per year at the moment"
		else
			"Sorry, I'm dead"
		end
	end
	
end

# tree = OrangeTree.new
# 5.times {tree.one_year_passes!}
# 5.times {tree.fruits}
# puts tree.fruits