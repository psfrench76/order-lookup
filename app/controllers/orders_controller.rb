class OrdersController < ApplicationController
  def view
    @order = Order.find(params[:id])
    @customer = @order.customer
    @order_details = @order.orderdetails
  end
  def index
  end
  def search
    query = params[:order_query].to_i
    if ord = Order.find_by_orderid(query)
      redirect_to "/orders/#{query}"
    else
      redirect_to root_path
    end 
  end
end
