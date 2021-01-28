class LikesController < ApplicationController
before_action :authenticate_account!


# def save_like
# @like = Like.new(post_id: params[:post_id], account_id: current_account.id)
# @post_id = params[:post_id]

# respond_to do |format|
# format.js {
# if Like.where(post_id: params[:post_id], account_id: current_account.id).any?
# # like already exists for post by this user
# @success = false
# 	elsif @like.save
# 		 @success = true 
# 	else
# 		 @success = false 
# 	end
# 	render "posts/like"
# }
# end


# end


  def create
    @like = current_account.likes.new(post_id: params[:post_id])

    if @like.save
      redirect_to posts_path, notice: 'You liked a post.'
    else
      redirect_to posts_path, alert: 'You cannot like this post.'
    end
  end

  def destroy
    like = Like.find_by(id: params[:id], account: current_account, post_id: params[:post_id])
    if like
      like.destroy
      redirect_to posts_path, notice: 'You disliked a post.'
    else
      redirect_to posts_path, alert: 'You cannot dislike post that you did not like before.'
    end
  end
end

