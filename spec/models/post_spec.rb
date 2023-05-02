require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'My recent post', text: 'This is my recent post', comments_counter: 0, likes_counter: 0) }

  before { subject.save }

  it 'title must be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title length must be less than or equal to 250' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be an integer' do
    subject.comments_counter = ''
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be greater than or equal to zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be an integer' do
    subject.likess_counter = ''
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be greater than or equal to zero' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'update user post counter' do
    expect(subject.user.post_counter).to eq(1)
  end

  it 'most_recent_comments should always return a total number of 5 comments' do
    expect(subject.most_recent_comments).to eq(subject.comments.last(5))
  end
end
