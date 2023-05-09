require 'rails_helper'

RSpec.describe 'comments/edit', type: :view do
  let(:comment) do
    Comment.create!(
      text: 'MyText'
    )
  end

  before(:each) do
    assign(:comment, comment)
  end

  it 'renders the edit comment form' do
    render

    assert_select 'form[action=?][method=?]', comment_path(comment), 'post' do
      assert_select 'textarea[name=?]', 'comment[text]'
    end
  end
end
