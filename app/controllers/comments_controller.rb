class CommentsController < ApplicationController
before_action :authenticate_account!

def index
@comments = Comment.all
end

def create
 @comment = Comment.new(comment_params)
# @comment = @post.comments.build(comment_params)
@comment.account_id = current_account.id if account_signed_in?

if @comment.save
	redirect_to dashboard_path, flash: { success: 'Comment was successfully created!' }
else
	redirect_to dashboard_path, flash: { danger: 'Comment was not created!' }
end

end

private

def comment_params
params.require(:comment).permit(:content, :post_id, :account_id)
	end

end
