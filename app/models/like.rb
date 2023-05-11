class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :update_posts_likes_counter

  def update_posts_likes_counter
    post.increment!(:likes_counter)
  end
end
