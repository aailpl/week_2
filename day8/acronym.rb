# def makeAcronym(str)
# 	ac=[]
# 	if str.class == String
# 		if (str.count "0-9") < 0 #str !~ /[0-9]/#(str.match /[0-9]/) == nil
			
# 			words=str.split(" ")
# 			words.each_index do |index|
# 				ac << words[index][0]
# 			end
# 			ac.join.upcase
# 		else
# 			"Not a letter"
# 		end
# 	else
# 		"Not a string"
# 	end	
# end

# puts makeAcronym("a-45")

#resolution

def makeAcronym(sentence)
	return "Not a string" unless sentence.is_a?(String)

		sentence.split.map do |word|
			word[0].upcase
		end.join
		
	end
end