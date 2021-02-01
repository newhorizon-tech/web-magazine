class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(priority: :desc).limit(4)
    @top_article = Article.left_joins(:votes).group(:id).order('COUNT(votes.id) DESC').first

    @articles = Article.all
    @articles.each do |article|
      Article.reset_counters(article.id, :votes)
    end
  end

  def show
    @category = Category.find(params[:id])
    @category_articles = @category.articles.with_attached_image.includes(:author).order(created_at: :desc)
  end
end
