class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true, uniqueness: true
  belongs_to :user

  def self.search(keyword)
    where(["title like?", "%#{keyword}%"])
  end
end
