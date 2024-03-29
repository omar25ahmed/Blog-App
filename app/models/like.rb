class Like < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  after_save :update_likes_counter

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
