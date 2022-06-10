require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should increase comments_counter by 1' do
    user = User.create(name: 'Omar ragheb')
    post = Post.create(title: 'Post Title', text: 'This is the post text', user_id: user.id)
    post.likes.create(user_id: user.id)
    expect(post.likes_counter).to eq(1)
  end
end
