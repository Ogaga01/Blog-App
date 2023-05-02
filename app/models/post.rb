class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: :comment_id
  has_many :likes, foreign_key: :post_id

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { integer: true, greater_than_or_equal_to: 0 }

  def update_users_posts_counter
    user.increment!(:post_counter)
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
