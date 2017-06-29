require 'rails_helper'

RSpec.describe "static_pages/contact.html.erb", type: :view do
  it "displays the given text" do
    render
    expect("<p>Welcome MLOG</p>").to match /p/
    expect("<span>Contact</span>").to match /span/
  end
end
