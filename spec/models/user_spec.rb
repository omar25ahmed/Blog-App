require 'rails_helper'

RSpec.describe 'Users', type: :model do
  subject { User.new(name: 'Omar ragheb')}

  before { subject.save }

  it 'should not be valid' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'should not be valid' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'should be valid if post_counter is an integer' do
    subject.posts_counter = 1
    expect(subject).to be_valid
  end

  it 'should not be valid if post_counter is not an integer' do
    subject.posts_counter = 'omar'
    expect(subject).to_not be_valid
  end

  it 'should return three posts' do
    (1..5).each do |i|
      Post.create(title: "Post #{i}", text: "This is the post #{i}", user_id: subject.id)
    end
    expect(subject.most_recent_posts.length).to eq(3)
  end
end
