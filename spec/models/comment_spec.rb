require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(name: 'Klaus', photo: 'Mikelson.png', bio: 'Always and forever', post_counter: 0)
  user.save
  post = Post.new(author_id: user.id, title: 'Hello Elijah', text: 'How is mum')
  post.save

  user.comments.create(post_id: post, text: 'I love the movie')

  it 'update comment counter' do
    expect(user.comments.length).to eq 1
  end
end
