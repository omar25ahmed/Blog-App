require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Omar ragheb')
  subject { Post.new(title: 'Post Title', text: 'This is the post text', user_id: user.id) }

  before { subject.save }

  it 'should not be valid' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'should not be invalid' do
    subject.title = "#{'a' * 300}"
    expect(subject).to_not be_valid
  end

  it 'should if comments_counter is an integer' do
    subject.comments_counter = 1
    expect(subject).to be_valid
  end

  it 'should comments_counter not valid if it\'s not an integer' do
    subject.comments_counter = 'omar'
    expect(subject).to_not be_valid
  end

  it 'should not be invalid if likes_counter is an integer' do
    subject.likes_counter = 1
    expect(subject).to be_valid
  end

  it 'should  be invalid if likes_counter is not an integer' do
    subject.likes_counter = 'omar'
    expect(subject).to_not be_valid
  end

  it 'should reduce text length' do
    subject.text = "#{'a' * 300}"
    expect(subject.brief_description.length).to eq(50)
  end
end
