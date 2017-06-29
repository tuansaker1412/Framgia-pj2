require "rails_helper"

RSpec.describe "static_pages/about.html.erb", type: :view do
  it "displays the given text" do
    render
    expect("<p>Welcome MLOG</p>").to match /p/
    expect("<span>About</span>").to match /span/
  end
end
