class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :votes
  has_many :article_categories
  has_many :categories, through: :article_categories
  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true, length: { in: 3..100}

  validates :category_ids,  presence: { message: "At least one category must be selected" }


  # validate :atleast_one_is_checked
  # validates_length_of :category_ids, minimum: 1, message: "You must select at least 1 category"


  scope :most_recent, -> { order("created_at desc").first }

end
