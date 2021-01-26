class PostsController < ApplicationController
	 before_action :authenticate_account!

def index
	@posts = Post.all.order('created_at DESC')
end

def show
@post = Post.find(params[:id])
end

def new
@post = Post.new
end

def create
@post = current_account.posts.build(post_params)
 @post.account_id = current_account.id if account_signed_in?
if @post.save
	redirect_to dashboard_path
else
	render 'new'
end
	end

private

def post_params
params.require(:post).permit(:title, :description, :image)
end

end
