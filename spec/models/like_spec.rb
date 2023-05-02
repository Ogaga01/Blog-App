require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(name: 'Klaus', photo: 'Mikelson.png', bio: 'Always and forever', post_counter: 0)
  user.save
  post = Post.new(author_id: user.id, title: 'Hello Elijah', text: 'How is mum')
  post.save

  user.likes.create(post_id: post, author_id: user.id)

  it 'update post likes counter' do
    expect(user.likes.length).to eq 1
  end
end
