class Customer < ActiveRecord::Base
	self.primary_key = "customerid"
	has_many :orders, foreign_key: "customerid"
	include Search

#	def self.search_customer_name query
#		first, last = query.split(' ', 2)
#		self.find_by_firstname_and_lastname(first, last)
#	end
#	def self.search_customer_email query
#		self.find_by_emailaddress(query)
#	end
#	def self.search_customer_address query
#		self.where("billingaddress1 like ?", "%#{query}%").first
#	end
#	def self.search_order_number query
#		Order.find_by_orderid(query)
#	end

	# disabling phone number search. The database column is formatted too inconsistently to make searching useful.
	# this could be resolved by cleaning the data, but I am leaving this out in favor of operating on the data
	# as it stands now.
	#def self.search_customer_phone query
	#	self.find_by_phonenumber(query)
	#end

	# returns sorted array of arrays: [[:search_customer_email, 1], [:search_customer_name, 0]]
	# according to heuristics about what fields input texts are likely to be, based on content
	# the first term in each pair is a search method name, which is passed to Customer.send by the controller
#	def self.order_searches input_text
#		hash = {search_customer_name: 0,
#			search_customer_email: 0,
#			search_customer_address: 0,
#			search_order_number: 0,
#			#search_customer_phone: 0
#		}
#		
#		if input_text =~ /@/
#			hash[:search_customer_email] += 5
#		end
#		if input_text =~ /-/
#			#hash[:search_customer_phone] += 3
#		end
#		
#		if input_text =~ /\s/
#			hash[:search_customer_name] += 1
#			hash[:search_customer_address] += 1
#		end
#
#		if input_text =~ /[A-z]/
#			#hash[:search_customer_phone] -= 1
#		else
#			hash[:search_customer_address] -= 1
#			hash[:search_customer_name] -= 1
#		end
#
#		if input_text =~ /\d/
#			hash[:search_customer_address] += 1
#			hash[:search_customer_name] -= 1
#			#hash[:search_customer_phone] += 1
#		else
#			hash[:search_customer_address] -= 1
#			#hash[:search_customer_phone] -= 1
#		end
#		
#		if input_text =~ /\A\d+\z/
#			hash[:search_order_number] += 5
#		end
#		
#		hash.sort_by {|method, priority| priority}.reverse
#	end
end
