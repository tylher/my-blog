class Post < ApplicationRecord
  has_many :comments

  has_many :likes

  belongs_to :author, class_name: "User", foreign_key: "author_id"

  has_one_attached :featured_image

  validates :likes_counter, :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :title, presence: true, length: { maximum: 250 }

  def update_post_count
    new_count = author.posts.count

    author.update(posts_counter: new_count)
  end

  def most_recent_comments
    comments.order(created_at: :desc).first(5)
  end

  def capitalize_title
    title.split.map { |word| word.capitalize() }.join(" ")
  end

  after_create :update_post_count

  def featured
    order(created_at: :desc).order(likes_counter: :desc).first(5)
  end
end
