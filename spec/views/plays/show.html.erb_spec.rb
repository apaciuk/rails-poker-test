require 'rails_helper'

RSpec.describe "plays/show", type: :view do
  before(:each) do
    assign(:play, Play.create!(
      status: "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Status/)
  end
end
