class AccountsController < ::ApplicationController
  def index
     @accounts = Account.find(25)
#     @accounts.each do |account|
     #   @account_status = @accounts.status_state
     # end
   end

  
end
