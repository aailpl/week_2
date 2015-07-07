require 'date'

class Transaction
	def initialize(amount)#,message="")
	# Initialize amount and date of transaction
		@date = DateTime.now
		@amount = amount
		#@message = message
	end
	def to_s
	# Nicely print transaction infos using Time#strftime.
		info = "#{@amount} euros on #{@date.strftime("%d/%m/%y")} at #{@date.strftime("%l:%M:%S%P")}"
		#if !@message.empty?
			#info << " Description: #{@message}"
		#end
		#info
	end
end