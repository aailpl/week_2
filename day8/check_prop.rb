require 'prime'

def number_property(num)

	[num.prime? && num>0,num.even?,num%10 == 0]

	# if num.prime?
	# 	result[0] = true
	# else
	# 	result [0] = false
	# end

	# if num.even?
	# 	result[1] = true
	# else
	# 	result[1] = false
	# end

	# if num%10 == 0
	# 	result[2] = true
	# else
	# 	result[2] = false
	# end

	# result
end

# class Fixnum
# 	def +(num)
# 		self * num
# 	end
# end

# puts 2 + 1

p number_property(-7)