class CustomersController < ApplicationController
  def view
    @customer = Customer.find(params[:id])
    @orders = @customer.orders
  end
  def index
  end
  def search
    if query = params[:name_query]
      first, last = query.split(' ', 2)
      if cust = Customer.find_by_firstname_and_lastname(first, last)
        redirect_to "/customers/#{cust.customerid}"
      else
        redirect_to root_path
      end
    elsif query = params[:email_query]
      if cust = Customer.find_by_emailaddress(query)
        redirect_to "/customers/#{cust.customerid}"
      else
        redirect_to root_path
      end
    end
  end
end
