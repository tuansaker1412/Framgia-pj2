require "rails_helper"

RSpec.describe "static_pages/about.html.erb", type: :view do
  it "displays the given text" do
    render
    expect(rendered).to have_tag("p", text: "Welcome MLOG")
    expect(rendered).to have_tag("span", text: "ABOUT")
  end
end
