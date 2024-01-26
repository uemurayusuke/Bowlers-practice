class Admin::SearchesController < ApplicationController
	 before_action :authenticate_admin!



def search

    @model = params[:model]
		@content = params[:content]
		@method = params[:method]
	if @model == 'user'
			@records = User.search_for(@content, @method).page(params[:page]).per(10)
	elsif @model == 'post'
			@records = Post.search_for(@content, @method).page(params[:page]).per(5)
	elsif @model == 'tag'
			@records = Tag.search_posts_for(@content, @method).page(params[:page]).per(5)
	elsif @model == 'comment'
		  @users = User.all
			@records = PostComment.search_comments_for(@content, @method).page(params[:page]).per(10)
	end
end
end
