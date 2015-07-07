def allow_to_drink(age)
	if !age #age==nil age.empty?
		"ERROR"
	elsif age > 18
		"Allowed to drink"
	else
		"Not allowed to drink"
	end
end

puts allow_to_drink(ARGV[0].to_i) #ARGV only since we know only one arg is passed

