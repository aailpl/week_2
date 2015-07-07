# class Email
# 	def initialize(subject, data)
# 		@subject = subject
# 		@date = data[:date]
# 		@from = data[:from]	
# 	end

# 	attr_reader :date, :from, :subject
# end

# class Mailbox
# 	def initialize(name,elements)
# 		@name = name
# 		@emails=elements	
# 	end	
# 	attr_reader :emails, :name
# end

# class MailboxHtmlFormatter
# 	def initialize(mailbox)
# 		@name=mailbox.name
# 		@emails=mailbox.emails		
# 	end
# 	def format
# 		output= "<html>\n\s\s<head>\n\s\s\s\s<style>\n\s\s\s\s\s\stable {\n\s\s\s\s\s\s\s\sborder-collapse: collapse;"+
# 				"\n\s\s\s\s\s\s}\n\s\s\s\s\s\std, th {\n\s\s\s\s\s\s\s\sborder: 1px solid black;\n\s\s\s\s\s\s\s\spadding: 1em;"+
# 				"\n\s\s\s\s\s\s}\n\s\s\s\s</style>\n\s\s</head>\n\s\s<body>\n\s\s\s\s<h1>#{@name}</h1>\n\s\s\s\s<table>"+
# 				"\n\s\s\s\s\s\s<thead>\n\s\s\s\s\s\s\s\s<tr>\n\s\s\s\s\s\s\s\s\s\s<th>Date</th>\n\s\s\s\s\s\s\s\s\s\s<th>From</th>"+
# 				"\n\s\s\s\s\s\s\s\s\s\s<th>Subject</th>\n\s\s\s\s\s\s\s\s</tr>\n\s\s\s\s\s\s</thead>\n\s\s\s\s\s\s<tbody>"
# 		@emails.each do |email|
# 			output << "\n\s\s\s\s\s\s\s\s<tr>\n\s\s\s\s\s\s\s\s\s\s<td>#{email.date}<td>\n\s\s\s\s\s\s\s\s\s\s<td>#{email.from}<td>"+
# 				"\n\s\s\s\s\s\s\s\s\s\s<td>#{email.subject}<td>\n\s\s\s\s\s\s\s\s</tr>"
# 		end
# 		output<<"\n\s\s\s\s\s\s</tbody>\n\s\s\s\s</table>\n\s\s</body>\n</html>"
# 	end
# end

# emails = [
#   Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
#   Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
#   Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
# ]
# mailbox = Mailbox.new("Ruby Study Group", emails)
# formatter = MailboxHtmlFormatter.new(mailbox)

# puts formatter.format

class Email
	def initialize(subject, data)
		@subject = subject
		@date = data[:date]
		@from = data[:from]	
	end

	attr_reader :date, :from, :subject
end

class Mailbox
	def initialize(name,emails)
		@name = name
		@emails=emails
	end	
	attr_reader :emails, :name
end

class MailboxHtmlFormatter
	def initialize(mailbox)	
		@mailbox=mailbox
	end
	def format
		["<html>",
			head,
			"<body>",
			title, table,
			"</body>",
			"</html>"
		].join("\n")
	end
	def head
	"	<head>
		    <style>
		      table {
		        border-collapse: collapse;
		      }
		      td, th {
		        border: 1px solid black;
		        padding: 1em;
		      }
		    </style>
		 </head>"		
	end
	def title
		"		<h1>#{@mailbox.name}</h1>"
	end
	def table
		["<table>", table_header,"<tbody>", table_body,"</tbody>","</table>"].join("\n")
	end
	def table_header
		"<thead>
	        <tr>
	          <th>Date</th>
	          <th>From</th>
	          <th>Subject</th>
	        </tr>
	      </thead>"
	end
	def table_body
		@mailbox.emails.map do |email|
	        "<tr>
	          <td>#{email.date}</td>
	          <td>#{email.from}</td>
	          <td>#{email.subject}</td>
	        </tr>"
	      end.join("\n")
	end
end

emails = [
  Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
  Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
  Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxHtmlFormatter.new(mailbox)

puts formatter.format
