class AccountsController < ApplicationController
 before_action :authenticate_account!
before_action :set_account, only: [:show]

#user feed(dashboard will be feed)
def index
	@posts = Post.all.order('created_at DESC').active
	@follower_suggestions = Account.where.not(id: current_account.id)
	
	
end

#user profile
def show
@posts = @account.posts.active
end 

def set_account
@account = Account.find_by_username(params[:username])
	end

private

def account_params
params.require(:account).permit(:username, :first_name, :last_name, :email,:password, :image)
end

end
