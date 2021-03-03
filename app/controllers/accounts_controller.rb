class AccountsController < ApplicationController
 before_action :authenticate_account!
before_action :set_account, only: [:show]

#user feed(dashboard will be feed)
def index
	@posts = Post.all.order('created_at DESC').active
	@comment = Comment.new
	# remove users who are add to following from div followers-suggestions
	following_ids = Follower.where(follower_id: current_account.id ).map(&:following_id)
	following_ids << current_account.id
	@follower_suggestions = Account.where.not(id: following_ids)
end

def follow_account
follower_id = params[:follow_id]
 if Follower.create!(follower_id: current_account.id, following_id: follower_id)
 	flash[:success] = 'You Are Following User'
 else
 	flash[:danger] = 'Unable to follow User'
 end
 redirect_to dashboard_path
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
