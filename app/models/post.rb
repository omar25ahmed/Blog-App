class Post < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
  has_many :likes, class_name: 'Like'
  has_many :comments, class_name: 'Comment'
  after_save :update_post_counter

  def update_post_counter
    user.increment!(:posts_counter)
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end