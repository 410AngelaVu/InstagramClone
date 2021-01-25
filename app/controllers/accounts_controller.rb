class AccountsController < ApplicationController
before_action :authenticate_account!

def index
#user feed(dashboard will be feed)
@posts = Post.active
end

def show
#user profile
end 

end
