class Post < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
  has_many :likes, class_name: 'Like'
  has_many :comments, class_name: 'Comment'
  after_save :update_post_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_post_counter
    user.increment!(:posts_counter)
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def brief_description
    text.truncate(50)
  end

  def liked?(user)
    likes.where(user_id: user.id).any?
  end
end
