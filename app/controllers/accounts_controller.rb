class AccountsController < ::ApplicationController
  def index
     search_params = []
     @accounts ||= Account.find(search_params)
   end
  
  def search

  end
  
end
