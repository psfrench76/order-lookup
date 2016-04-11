class CustomersController < ApplicationController
  def view
	@customer = Customer.find(params[:id])
  end
  def index
  end
end
