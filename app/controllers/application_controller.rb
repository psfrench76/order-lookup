class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Search

  def search
    if @query = params[:global_query]
      searches = order_searches @query     
      searches.each do |method, priority|
        if result = send(method, @query)
          puts searches
          redirect_to result
          return
        end
      end
      redirect_to controller: "orders", action: "index", result: "none"
    end
  end
end
