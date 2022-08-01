class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  validates :author_id, uniqueness: true
  def update_likes_count
    new_count = post.likes.count
    post.update(likes_counter: new_count)
  end

  after_create :update_likes_count
end
