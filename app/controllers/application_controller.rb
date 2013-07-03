class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  # i'm thinking this should contain anything that doesn't pertain directly to 
  # accounts business logic

  def page
    @page ||= params[:per_page].to_i.zero? ? 1 : params[:page].to_i
  end
  
  def per

  end

end
