module Search
	extend ActiveSupport::Concern

	def search_customer_name query
		first, last = query.split(' ', 2)
		if cust = Customer.find_by_firstname_and_lastname(first, last)
			cust
		elsif cust = Customer.find_by_firstname(query)
			cust
		else 
			Customer.find_by_lastname(query)
		end
	end
	def search_customer_email query
		Customer.find_by_emailaddress(query)
	end
	def search_customer_address query
		Customer.where("billingaddress1 like ?", "%#{query}%").first
		end
	def search_order_number query
		Order.find_by_orderid(query)
	end

	# returns sorted array of arrays: [[:search_customer_email, 1], [:search_customer_name, 0]]
	# according to heuristics about what fields input texts are likely to be, based on content
	# the first term in each pair is a search method name, which is passed to self.send by the controller
	def order_searches input_text
		hash = {search_customer_name: 0,
			search_customer_email: 0,
			search_customer_address: 0,
			search_order_number: 0,
		}
		
		if input_text =~ /@/
			hash[:search_customer_email] += 5
		end
		
		if input_text =~ /\s/
			hash[:search_customer_name] += 1
			hash[:search_customer_address] += 1
		end

		if input_text =~ /[A-z]/
		else
			hash[:search_customer_address] -= 1
			hash[:search_customer_name] -= 1
		end

		if input_text =~ /\d/
			hash[:search_customer_address] += 1
			hash[:search_customer_name] -= 1
		else
			hash[:search_customer_address] -= 1
		end
		
		if input_text =~ /\A\d+\z/
			hash[:search_order_number] += 5
		end
		
		hash.sort_by {|method, priority| priority}.reverse
	end
end
