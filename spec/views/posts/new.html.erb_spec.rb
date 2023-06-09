require 'rails_helper'

RSpec.describe 'posts/new', type: :view do
  before(:each) do
    assign(:post, Post.new(
                    title: 'MyString',
                    text: 'MyText',
                    comments_counter: 1,
                    likes_counter: 1
                  ))
  end

  it 'renders new post form' do
    render

    assert_select 'form[action=?][method=?]', posts_path, 'post' do
      assert_select 'input[name=?]', 'post[title]'

      assert_select 'textarea[name=?]', 'post[text]'

      assert_select 'input[name=?]', 'post[comments_counter]'

      assert_select 'input[name=?]', 'post[likes_counter]'
    end
  end
end
