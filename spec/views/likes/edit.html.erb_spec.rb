require 'rails_helper'

RSpec.describe "likes/edit", type: :view do
  let(:like) {
    Like.create!()
  }

  before(:each) do
    assign(:like, like)
  end

  it "renders the edit like form" do
    render

    assert_select "form[action=?][method=?]", like_path(like), "post" do
    end
  end
end
