require './spec/spec_helper'

RSpec.describe "When a user visits a homepage" do
  it "sees a welcome message" do
    visit('/')
    save_and_open_page
    expect(page).to have_content("Welcome")
  end
end
