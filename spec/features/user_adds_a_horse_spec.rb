require './spec/spec_helper'

RSpec.describe "When a user wants to add a new horse" do
  it "they can click the new horse button" do
    visit('/')
    click_link("Add A New Horse")

    expect(current_path).to eq('/horses/new')
  end

  it "they can fill in the fields and click submit" do
    Jockey.create(name: "Jim")
    Breed.create(name: "Mustang")
    visit('/horses/new')
    fill_in("horse[name]", with: "squee")
    fill_in("horse[total_winnings]", with: 1200)
    select("Jim", from: "horse[jockey_id]")
    select("Mustang", from: "horse[breed_id]")
    click_button("Create New Horse")

    expect(Horse.all.count).to eq(1)
  end
end
