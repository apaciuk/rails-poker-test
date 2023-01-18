require 'rails_helper'

RSpec.describe "plays/show", type: :view do
  before(:each) do
    assign(:play, Play.create!(
      status: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
  end
end
