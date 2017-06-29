require 'rails_helper'

RSpec.describe "static_pages/index.html.erb", type: :view do
  it "displays the given text" do
    render
    expect("<p>Get started?</p>").to match /p/
    expect("<span>Welcome Mlog</span>").to match /span/
    expect("<a>Sign up</a>").to match /a/
    expect("<a>Sign in</a>").to match /a/
    expect("<span>Card Title</span>").to match /span/
    expect("<p>I am a very simple card.</p>").to match /p/
    expect("<a>Read more</a>").to match /a/
  end
end
