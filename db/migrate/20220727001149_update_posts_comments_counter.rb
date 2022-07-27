# frozen_string_literal: true

class UpdatePostsCommentsCounter < ActiveRecord::Migration[7.0]
  def change
    change_column_default :posts, :comments_counter, from: nil, to: 0
  end
end
