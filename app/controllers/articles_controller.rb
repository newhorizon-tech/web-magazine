class ArticlesController < ApplicationController
  def new
  end
  def create
  end

  def upvote
    @article = Article.find(params[:id])
    @vote = Vote.new(user: current_user, article: @article)
    if @vote.save
      flash.alert = 'You have succesfully upvoted the article'
    else
      flash.alert = "You can't upvote the article twice!"
    end
    redirect_back(fallback_location: root_path)
  end
end
