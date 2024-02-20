class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]

    if @model == 'user'
      @records = User.search_for(@content, @method).page(params[:page]).per(10).order(created_at: :desc)
    elsif @model == 'post'
      @records = Post.search_for(@content, @method).page(params[:page]).per(5).order(created_at: :desc)
    elsif @model == 'tag'
      @records = Kaminari.paginate_array(Tag.search_posts_for(@content, @method)).page(params[:page]).per(5)
    elsif @model == 'comment'
      @users = User.all
      @records = PostComment.search_comments_for(@content, @method).page(params[:page]).per(10).order(created_at: :desc)
    end
  end
end

# 整理完了