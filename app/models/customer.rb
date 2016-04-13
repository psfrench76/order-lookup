class Customer < ActiveRecord::Base
	self.primary_key = "customerid"
	has_many :orders, foreign_key: "customerid"
end
