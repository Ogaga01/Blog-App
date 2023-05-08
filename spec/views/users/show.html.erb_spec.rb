require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    assign(:user, User.create!(
      name: "Name",
      photo: "Photo",
      bio: "Bio",
      post_counter: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Photo/)
    expect(rendered).to match(/Bio/)
    expect(rendered).to match(/2/)
  end
end
