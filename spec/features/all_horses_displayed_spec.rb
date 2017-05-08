require './spec/spec_helper'

RSpec.describe "All horses can be found on the horses index" do
  it "can get to the horses index" do
    Jockey.create(name: "Rosie")
    Breed.create(name: "Mustang")
    Horse.create(name: "Samantha", age: 29, total_winnings: 10, jockey_id: 1, breed_id: 1)
    Horse.create(name: "Jose", age: 2, total_winnings: 15, jockey_id: 1, breed_id: 1)
    Horse.create(name: "Spencer", age: 7, total_winnings: 35, jockey_id: 1, breed_id: 1)

    visit ('/horses')

    expect(Horse.count).to eq(3)

    expect(page).to have_content("Samantha")
    expect(page).to have_content("Jose")
    expect(page).to have_content("Spencer")

  end
end
