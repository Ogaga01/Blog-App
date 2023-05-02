require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(name: 'Klaus', photo: 'Mikelson.png', bio: 'Always and forever', post_counter: 0)
  user.save
  post = Post.new(user_id: user, title: 'Hello Elijah', text: 'How is mum')
  post.save

  user.likes.create(post_id: post, text: 'I love the movie')

  it 'update likes counter' do
    expect(user.likes.length).to eq 1
  end

  it 'update post comment counter' do
    expect(subject.post.comments_counter).to eq(1)
  end
end