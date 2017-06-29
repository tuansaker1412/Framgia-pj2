require "rails_helper"

RSpec.describe "static_pages/index.html.erb", type: :view do
  it "displays the given text" do
    render
    expect(rendered).to have_tag("h5", text: "Get started?")
    expect(rendered).to have_tag("h3", text: "Welcome MLOG")
  end
end
