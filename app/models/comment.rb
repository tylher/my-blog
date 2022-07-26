# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  def update_comment_count
    new_count = post.comments.count
    post.update(comments_counter: new_count)
  end
end
