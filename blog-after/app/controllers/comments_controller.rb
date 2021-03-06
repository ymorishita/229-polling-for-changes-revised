class CommentsController < ApplicationController
  before_filter :load_article
  
  def index
    @comments = @article.comments.where('id > ?', params[:after].to_i)
  end

  def create
    @comment = @article.comments.build(params[:comment])
    if @comment.save
      redirect_to @article, notice: "Added comment."
    else
      render :new
    end
  end

private

  def load_article
    @article = Article.find(params[:article_id])
  end
end
