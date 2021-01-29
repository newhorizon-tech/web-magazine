class ArticlesController < ApplicationController
  before_action :redirect_if_not_logged_in, only: %i[new upvote]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    @categories_list = Category.all.limit(4)
  end

  def create
    @article = Article.new(article_params)
    if @article.save
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
    else
      @vote = Vote.new(user: current_user, article: @article)
      flash.alert = if @vote.save
                      'You have succesfully liked the article'
                    else
                      "You can't like the same article twice!"
                    end
    end
    redirect_back(fallback_location: root_path)
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
    params.require(:article).permit(:title, :text, :image, category_ids: []).merge(author_id: current_user.id)
  end
end
