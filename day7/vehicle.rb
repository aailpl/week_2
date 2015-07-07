class Vehicle
	def initialize(wheels)
		@wheels = wheels
	end

	def to_s
		"I have #{@wheels} wheels"
	end	

	def color
		"white"
	end
end

class Car < Vehicle 
	def initialize(wheels,engine)
		super(wheels)
		@engine = engine
	end
	def to_s
		super + " and a #{engine}cc engine"	
	end	
end

class Bicycle < Vehicle
	def initialize(wheels)
		super(wheels)
	end	
end

vehicle = Vehicle.new(3)
puts vehicle

car = Car.new(4,1500) 
puts car.color

bicycle = Bicycle.new(2)
puts bicycle.color