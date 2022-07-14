class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  scope :update_post, ->(id, text) { find_by(id:).update(text:) }
  # Ex:- scope :active, -> {where(:active => true)}
end
