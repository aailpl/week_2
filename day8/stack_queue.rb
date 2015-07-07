class Stack
	def initialize
		@elements=[]
	end

	def push(val)
		@elements.push(val)
		#@elements << val
	end
	
	def pop
		@elements.pop
		#@elements.delete(@elements.last)
		#@elements.delete_at(-1)
	end
	
end

class Queue

	def initialize
		@elements=[]
	end

	def enqueue(val)
		@elements.unshift(val)
		#@elements.push(val)		
		#@elements << val		
	end

	def dequeue
		@data.pop
		#@elements.delete_at(0)
		#@elements.delete(@elements.first)
		#@elements.shift
	end	
end

# stack = Stack.new
# p stack.push(2)
# p stack.push(3)
# p stack.pop # => 3
# p stack.pop # => 2
# p stack.pop # => nil

queue = Queue.new
p queue.enqueue(2)
p queue.enqueue(3)
p queue.dequeue # => 2
p queue.dequeue # => 3
p queue.dequeue # => nil