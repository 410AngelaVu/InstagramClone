class AddTotalLikesCountToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :total_likes_count, :integer
  end
end
