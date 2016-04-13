class Order < ActiveRecord::Base
	self.primary_key = "orderid"
	has_many :orderdetails, foreign_key: "orderid"
	belongs_to :customer, foreign_key: "customerid"
end

