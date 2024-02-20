class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]

    if @model == 'user'
      @records = User.search_for(@content, @method).page(params[:page]).per(10).order(created_at: :desc)
    elsif @model == 'post'
      @records = Post.search_for(@content, @method).page(params[:page]).per(5).order(created_at: :desc)
    elsif @model == 'tag'
      @records = Tag.search_posts_for(@content, @method).order(created_at: :desc).page(params[:page]).per(5)
    end
  end
end

# 整理完了