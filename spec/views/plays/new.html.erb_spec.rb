require 'rails_helper'

RSpec.describe "plays/new", type: :view do
  before(:each) do
    assign(:play, Play.new(
      status: "MyString"
    ))
  end

  it "renders new play form" do
    render

    assert_select "form[action=?][method=?]", plays_path, "post" do

      assert_select "input[name=?]", "play[status]"
    end
  end
end
