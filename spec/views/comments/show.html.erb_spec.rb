require 'rails_helper'

RSpec.describe 'comments/show', type: :view do
  before(:each) do
    assign(:comment, Comment.create!(
                       text: 'MyText'
                     ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyText/)
  end
end
