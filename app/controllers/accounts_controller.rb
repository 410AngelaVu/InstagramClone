class AccountsController < ApplicationController
before_action :authenticate_account!
before_action :set_account, only: [:show]

#user feed(dashboard will be feed)
def index
	@posts = Post.active
	
end

#user profile
def show
	
end 

def set_account
@account = Account.find_by_username(params[:username])
	end

# def account_params
# params.require(:account).permit(:username, :first_name, :last_name, :email,:password)
# end

end
