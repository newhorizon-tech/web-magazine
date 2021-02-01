class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article, counter_cache: true
  validates_uniqueness_of :user_id, scope: :article_id
end
