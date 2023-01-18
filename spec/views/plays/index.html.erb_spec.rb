require 'rails_helper'

RSpec.describe "plays/index", type: :view do
  before(:each) do
    assign(:plays, [
      Play.create!(
        status: 2
      ),
      Play.create!(
        status: 2
      )
    ])
  end

  it "renders a list of plays" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
