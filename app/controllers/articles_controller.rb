class ArticlesController < ApplicationController
  before_action :redirect_if_not_logged_in, only: [:new]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    @categories_list = Category.all
  end

  def create
    @article = Article.new(article_params)
    @id_list = params[:article][:category_ids].reject(&:blank?)
    if @article.save
      @id_list.each do |category_id|
        category_id = category_id.to_i
        ArticleCategory.create!(article: @article, category_id: category_id)
      end
      flash.alert = 'You have succesfully created the article!'
    else
      flash.alert = @article.errors.full_messages
    end
    redirect_to root_path
  end

  def upvote
    @article = Article.find(params[:id])
    if @article.author.id == current_user.id
      flash.alert = "You can't upvote your own article!"
      redirect_back(fallback_location: root_path)
    else
      @vote = Vote.new(user: current_user, article: @article)
      if @vote.save
        flash.alert = 'You have succesfully upvoted the article'
      else
        flash.alert = "You can't upvote the article twice!"
      end
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def article_params
    params.require(:article).permit(:title,:text,:image).merge(author_id: current_user.id)
  end
end
