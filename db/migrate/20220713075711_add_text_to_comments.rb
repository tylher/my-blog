# frozen_string_literal: true

class AddTextToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :text, :text
  end
end
