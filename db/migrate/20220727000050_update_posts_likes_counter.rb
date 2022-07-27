# frozen_string_literal: true

class UpdatePostsLikesCounter < ActiveRecord::Migration[7.0]
  def change
    change_column_default :posts, :likes_counter, from: nil, to: 0
  end
end
