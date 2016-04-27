class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    @order_details = @order.orderdetails
  end
  def index
  end
end
