class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true, uniqueness: true
  belongs_to :user
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags
end
