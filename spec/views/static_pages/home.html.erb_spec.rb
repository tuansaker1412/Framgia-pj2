require 'rails_helper'

RSpec.describe "static_pages/home.html.erb", type: :view do
  it "displays the given text" do
    render
    expect("<p>Welcome MLOG</p>").to match /p/
    expect("<span>Home</span>").to match /span/
  end
end
