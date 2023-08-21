class AddPublishedToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :published, :boolean, default: false
  end
end
