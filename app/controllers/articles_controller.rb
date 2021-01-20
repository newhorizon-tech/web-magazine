class ArticlesController < ApplicationController
  before_action :redirect_if_not_logged_in, only: [:new, :upvote]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    @categories_list = Category.all.limit(4)
  end

  def create
    @article = Article.new(article_params)
    @cat_list = params[:article][:category_ids].reject(&:blank?)
    if @article.save
      unless @cat_list.empty?
        @cat_list.each do |cat_id|
          ArticleCategory.create!(article: @article, category_id: cat_id.to_i)
        end
      end
      flash.alert = 'You have succesfully created the article!'
    else
      flash.notice = @article.errors.full_messages.to_sentence
    end
    redirect_back(fallback_location: root_path)
  end

  def upvote
    @article = Article.find(params[:id])
    if @article.author.id == current_user.id
      flash.alert = "You can't like your own article!"
      redirect_back(fallback_location: root_path)
    else
      @vote = Vote.new(user: current_user, article: @article)
      if @vote.save
        flash.alert = 'You have succesfully liked the article'
      else
        flash.alert = "You can't like the same article twice!"
      end
      redirect_back(fallback_location: root_path)
    end
  end

  def random
    @article = Article.all.sample
    redirect_to article_path(@article)
  end

  def show
    @article = Article.find(params[:id])
  end


  private
  def article_params
    params.require(:article).permit(:title,:text,:image,:category_ids => []).merge(author_id: current_user.id)
  end
end
