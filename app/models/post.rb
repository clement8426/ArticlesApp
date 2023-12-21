class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :photo


  validates :title, presence: true
  validates :content, presence: true
  validates :url, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_content,
    against: [ :title, :content ],
    using: {
      tsearch: { prefix: true }
    }
end
