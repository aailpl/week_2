class OrangeTree 
	def initialize
		@age=0
		@height=0
		@fruits=0
		@life='live'
		birth
	end	

	def one_year_passes!
		age_one_year
		check_life		
	end

	private

	def birth
		@probalility=[]
		50.times{ @probalility << 'live'}
	end
	def age_one_year
		@age += 1
	end

	def check_life
		if @age>=50
			death
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
		if @age>=5 and @age<10
			@fruits=100
		elsif @age>=10 and @age<15
			@fruits=200
		else
			@fruits=0
		end
	end

	def death
		@probalility[@age-50] = 'dead'
		@life = @probalility[rand(0..50)]
	end
	
end

tree = OrangeTree.new
60.times {tree.one_year_passes!}

p tree