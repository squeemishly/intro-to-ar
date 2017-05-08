require './spec/spec_helper'

RSpec.describe "A user can see the jockey's stats" do
  it "displays their total winnings" do
    Jockey.create(name: "Rosie")
    Breed.create(name: "Mustang")
    Horse.create(name: "Samantha", age: 29, total_winnings: 10, jockey_id: 1, breed_id: 1)
    Horse.create(name: "Jose", age: 2, total_winnings: 15, jockey_id: 1, breed_id: 1)
    Horse.create(name: "Spencer", age: 7, total_winnings: 35, jockey_id: 1, breed_id: 1)

    visit('/jockeys/1')
    save_and_open_page

    expect(page).to have_content("Total Winnings: 60")
  end
end
