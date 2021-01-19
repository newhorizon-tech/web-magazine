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
    @id_list = params[:article][:category_ids].reject(&:blank?)
    unless @article.image.attached
      imagepath = File.join(Rails.root, view_context.asset_path("default.png"))
      @article.image.attach(io: File.open(imagepath),
                            filename: "default.png",
                            content_type: "image/png")
    end
    if @article.save
      if @id_list.empty?
         @misc_category = Category.find_by(priority: 0)
         ArticleCategory.create!(article: @article, category: @misc_category)
      else
        @id_list.each do |category_id|
          category_id = category_id.to_i
          ArticleCategory.create!(article: @article, category_id: category_id)
        end
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
    params.require(:article).permit(:title,:text,:image).merge(author_id: current_user.id)
  end
end
