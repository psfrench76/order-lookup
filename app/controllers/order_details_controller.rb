class OrderDetailsController < ApplicationController
  def view
	@order_detail = Orderdetail.find_by orderdetailid: params[:id]
	@order = @order_detail.order
	@customer = @order.customer
	@options = []
	@order_detail.optionids.split(',').each do |opt|
		@options << Option.find(opt.to_i)
	end
  end
end
