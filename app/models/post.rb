class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  scope :update_post, ->(id, text) { find_by(id:).update(text:) }
  
  def most_recent_comments
    comments.order(created_at: :desc).first(5)
  end
end
