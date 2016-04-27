class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @orders = @customer.orders
  end
  def index
  end
#  def search
#    if query = params[:global_query]
#      searches = Customer.order_searches query     
#      searches.each do |method, priority|
#        if result = Customer.send(method, query)
#          puts searches
#          redirect_to result
#          return
#        end
#      end
#      redirect_to root_path
#    end
#  end
end
