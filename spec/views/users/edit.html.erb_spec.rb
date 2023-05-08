require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  let(:user) {
    User.create!(
      name: "MyString",
      photo: "MyString",
      bio: "MyString",
      post_counter: 1
    )
  }

  before(:each) do
    assign(:user, user)
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(user), "post" do

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[photo]"

      assert_select "input[name=?]", "user[bio]"

      assert_select "input[name=?]", "user[post_counter]"
    end
  end
end
