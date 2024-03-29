# frozen_string_literal: true

class AddUsersRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :author, null: false, foreign_key: { to_table: :users }
  end
end
