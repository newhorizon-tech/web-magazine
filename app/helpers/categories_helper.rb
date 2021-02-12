module CategoriesHelper
  def latest_article(category)
    category.articles.most_recent
  end

  def display_article?(top_article)
    !top_article.blank?
  end
end
