class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :votes
  has_many :article_categories
  has_many :categories, through: :article_categories
  has_one_attached :image

  validates :image, attached: true, content_type: { in: [:png, :jpg, :jpeg], message: 'is not a PNG or JPG'}
  validates :title, presence: true, length: { in: 3..100 }

  validates :category_ids, presence: { message: 'At least one category must be selected' }

  scope :most_recent, -> { order('created_at desc').first }

  def grab_image
    downloaded_image = URI.open('https://dummyimage.com/300.png')
    image.attach(io: downloaded_image, filename: '300.png', content_type: 'image/png')
  end
end
